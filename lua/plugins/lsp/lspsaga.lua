return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        diagnostic = {
          -- 診断サインを無効にする
          sign = false,
        },
        code_action = {
          -- コードアクションのシンボルを非表示にする
          show_server_name = false,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",     -- optional
    },
    event = "LspAttach",
  },
}
