return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- 必要なLSPサーバーをここに追加
      })
    end,
  },
}
