return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension("frecency")
        end,
      },
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", ":Telescope find_files<CR>" },
    },
  },
}
