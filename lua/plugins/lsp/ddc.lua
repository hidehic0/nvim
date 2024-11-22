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
      vim.fn["ddc#custom#patch_global"]("ui", { "native" })
      vim.fn["ddc#custom#patch_global"]("sources", { "lsp" })
      vim.fn["ddc#custom#patch_global"]("sourceOptions", {
        _ = {
          matchers = { "matcher_fuzzy" },
          sorters = { "sorter_fuzzy" },
          converters = { "converter_fuzzy", "converter_remove_overlap" },
        },
        lsp = {
          mark = "[LSP]",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
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
