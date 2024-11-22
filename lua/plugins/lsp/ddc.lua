return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-source-around",
      "Shougo/ddc-ui-native",
      "Shougo/ddc-source-around",
      "tani/ddc-fuzzy",
    },
    event = "InsertEnter",
    config = function()
      vim.fn["ddc#custom#patch_global"]("ui", "native")

      vim.fn["ddc#custom#patch_global"]("sources", { "around" })

      vim.fn["ddc#custom#patch_global"]("sourceOptions", {
        _ = {
          matchers = { "matcher_fuzzy" },
          sorters = { "sorter_fuzzy" },
          converters = { "converter_fuzzy" },
        },
      })

      vim.fn["ddc#enable"]()
    end,
  },
}
