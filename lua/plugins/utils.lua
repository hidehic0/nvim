return {
  {
    -- lspの通知をおしゃれにしてくれる
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {
      -- options
    },
  },
  {
    -- カッコの機能を色々サポートしている
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "vim-denops/denops.vim",
    event = "VeryLazy",
  },
}
