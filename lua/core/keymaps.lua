-- mapの設定
vim.g.mapleader = " "
-- jj をescにする設定
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- クリップボードの設定
vim.opt.clipboard:append({ "unnamedplus" })
