return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },
}
