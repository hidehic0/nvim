return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-source-around",
      "Shougo/ddc-ui-native",
      "tani/ddc-fuzzy",
      "Shougo/ddc-source-lsp",
      -- "Shougo/ddc-sorter_rank",
      "Shougo/ddc-converter_remove_overlap",
    },
    event = "InsertEnter",
    config = function()
      local patch_global = vim.fn["ddc#custom#patch_global"]
      patch_global("ui", { "native" })
      patch_global("autoCompleteEvents", {
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "CmdlineChanged",
      })
      patch_global("sources", { "lsp" })
      patch_global("sourceOptions", {
        _ = {
          matchers = { "matcher_fuzzy" },
          sorters = { "sorter_fuzzy" },
          converters = { "converter_fuzzy", "converter_remove_overlap" },
        },
        lsp = {
          mark = "lsp",
          dup = "keep",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
          sorters = { "sorter_lsp-kind", "sorter_fuzzy" },
        },
      })
      vim.cmd([[
inoremap <expr> <TAB>
	\ pumvisible() ? '<C-n>' :
	\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
	\ '<TAB>' : ddc#map#manual_complete()

	inoremap <expr> <S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
      ]])
      vim.fn["ddc#enable"]()
    end,
  },
}
