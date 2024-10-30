return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- lspのセットアップ
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig")["lua_ls"].setup({
        capabilities = capabilities,
      })
      require("lspconfig")["pyright"].setup({
        capabilities = capabilities,
      })
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Luasnipとの連携
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "L3MON4D3/LuaSnip" }, -- スニペットのサポート
    },
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
        },
      })
      -- luaのfomat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.lua",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- pythonのformat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
