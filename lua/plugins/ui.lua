return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    cmd = { "Neotree" },
    keys = { { "<leader>e", ":Neotree<CR>" } },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      --      vim.keymap.set("n", "g", "t", "<Cmd>BufferLineCycleNext<CR>", {})
      --     vim.keymap.set("n", "g", "T", "<Cmd>BufferLineCyclePrev<CR>", {})
      local bufferline = require("bufferline")
      require("bufferline").setup({
        options = {
          -- mode = "tabs",
          style_preset = bufferline.style_preset.minimal,
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
          diagnostics = "nvim_lsp",
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
}
