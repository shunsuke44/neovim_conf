vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 100
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.display = truncate
vim.opt.scrolloff = 5
vim.opt.nrformats:remove({ "octal" })
vim.opt.laststatus = 2
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.virtualedit = "block"
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.updatetime = 1000
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { eol = "↵", trail = "•", tab = ">-" }
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backup = false
vim.opt.encoding = "utf-8"
