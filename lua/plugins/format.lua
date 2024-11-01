return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
        },
      })

      -- Luaのformat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.lua",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Pythonのformat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- シェルスクリプトのformat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.sh", "*.zsh" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
      -- c++のformat on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.cpp", "*.cc", "*.cxx" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
