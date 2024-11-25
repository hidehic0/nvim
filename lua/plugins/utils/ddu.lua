return {
  "Shougo/ddu.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-filter-matcher_substring",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-kind-file",
    "uga-rosa/ddu-filter-converter_devicon",
  },

  config = function()
    vim.fn["ddu#custom#patch_global"]({
      ui = "ff",
      uiParams = {
        ff = {
          startAutoAction = true,
          autoAction = {
            delay = 0,
            name = "preview",
          },
          floatingBorder = "rounded",
          previewFloating = true,
          previewFloatingBorder = "rounded",
          previewFloatingTitle = "Preview",
          previewSplit = "horizontal",
          prompt = "> ",
          split = "floating",
        },
      },
    })
    vim.fn["ddu#custom#patch_local"]("file_recursive", {
      sources = {
        {
          name = { "file_rec" },
          options = {
            matchers = {
              "matcher_substring",
            },
            converters = {
              "converter_devicon",
            },
            ignoreCase = true,
          },
        },
      },
      kindOptions = {
        file = {
          defaultAction = "open",
        },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff",
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set({ "n" }, "q", [[<Cmd>call ddu#ui#do_action("quit")<CR>]], opts)
        vim.keymap.set({ "n" }, "<Cr>", [[<Cmd>call ddu#ui#do_action("itemAction")<CR>]], opts)
        vim.keymap.set({ "n" }, "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
        vim.keymap.set({ "n" }, "P", [[<Cmd>call ddu#ui#do_action("togglePreview")<CR>]], opts)
      end,
    })
  end,
  keys = { { "<leader>ff", "<Cmd>call ddu#start(#{name:'file_recursive'})<CR>" } },
  event = "VeryLazy",
}
