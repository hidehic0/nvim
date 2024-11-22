return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "Shougo/ddc-source-lsp" },
      { "vim-denops/denops.vim" },
      { "uga-rosa/ddc-source-lsp-setup" },
    },
    config = function()
      -- lspのセットアップ
      local capabilities = require("ddc_source_lsp").make_client_capabilities()
      require("ddc_source_lsp").make_client_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
      })

      lspconfig["pyright"].setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      })
      lspconfig["ruff"].setup({})
      lspconfig["bashls"].setup({
        capabilities = capabilities,
        filetypes = { "sh", "bash", "zsh" }, -- シェルスクリプト用のファイルタイプを指定
      })
      lspconfig["clangd"].setup({
        capabilities = capabilities,
      })

      lspconfig["marksman"].setup({
        on_attach = function(client, bufnr)
          -- 必要に応じてキーマッピングを設定します
        end,
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr) end,
        capabilities = capabilities,
      })
    end,
  },
}
