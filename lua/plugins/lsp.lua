return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- lspのセットアップ
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
      })
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              useLibraryCodeForTypes = true, -- ライブラリから型情報を取得する設定
              autoImportCompletions = false, -- 自動でのimport補完を無効化
              diagnosticMode = "openFilesOnly", -- 開いているファイルのみをチェック対象に
              pythonPath = "pypy3",
            },
          },
        },
      })
      lspconfig["bashls"].setup({
        capabilities = capabilities,
        filetypes = { "sh", "bash", "zsh" }, -- シェルスクリプト用のファイルタイプを指定
      })
      lspconfig.clangd.setup({
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
