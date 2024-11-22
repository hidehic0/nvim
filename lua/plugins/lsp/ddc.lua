return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-source-around",
      "Shougo/ddc-ui-native",
      "tani/ddc-fuzzy",
      "Shougo/ddc-source-lsp",
    },
    event = "InsertEnter",
    config = function()
      vim.fn["ddc#custom#patch_global"]("ui", "native")

      vim.fn["ddc#custom#patch_global"]("sources", { "lsp" })

      vim.fn["ddc#custom#patch_global"]("sourceOptions", {
        _ = {
          matchers = { "matcher_fuzzy" },
          sorters = { "sorter_fuzzy" },
          converters = { "converter_fuzzy" },
        },
        lsp = {
          mark = "lsp",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
        },
      })

      vim.fn["ddc#enable"]()
    end,
  },
}
