return {
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    lazy = true,
    keys = { { "<leader>w", ":HopWord<CR>" }, { "<leader>s", ":HopChar2<CR>" }, { "<leader>l", ":HopLine<CR>" } },
  },
  {
    "folke/tokyonight.nvim",
    event = "VimEnter",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
}
