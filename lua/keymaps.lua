vim.keymap.set("n", "<F2>", ":let @/=''<CR>")
-- window navigation
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
-- make undo checkpoint before using CTRL-u
vim.keymap.set("i", "<C-u>", "<C-G>u<C-u>")
-- terminal
vim.keymap.set("t", "<ESC>", "<C-><C-n>")

-- set leader key
vim.g.mapleader = " "

-- mouse
-- vim.cmd([[
--   if has('mouse')
--     if &term =~ 'xterm'
--       set mouse=a
--     else
--       set mouse=nvi
--     endif
--   endif
-- ]])
