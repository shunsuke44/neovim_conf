-- NerdTree
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeSortHiddenFirst = 1
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
vim.keymap.set("n", "<leader>t", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")

-- fzf.vim
vim.keymap.set("n", "<leader>f", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":Buffers<CR>", { silent = true })

-- airline
vim.g.airline_left_sep = ">"
vim.g.airline_right_sep = "<"
vim.g.airline_detect_modified = 1

-- emmet
vim.g.user_emmet_install_global = 0

local emmet_filetypes = {
	"html",
	"htmldjango",
	"css",
	"typescript",
	"typescriptreact",
	"eruby",
  "gohtmltmpl",
}

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("EmmetInstall", { clear = true }),
	pattern = filetypes,
	command = "EmmetInstall",
})

return {
	-- colorschemes
	{
		"jacoborus/tender.vim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tender]])
		end,
	},

	-- tools
	"vim-airline/vim-airline",

	"vim-airline/vim-airline-themes",

	{ "preservim/nerdtree", lazy = false },

	{ "junegunn/fzf", name = "fzf", dir = "~/.fzf" },

	"junegunn/fzf.vim",

	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	"nvim-lua/plenary.nvim",

	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	{ "mattn/emmet-vim", cmd = "EmmetInstall" },

	-- lsp
	"jose-elias-alvarez/null-ls.nvim",

	"williamboman/mason.nvim",

	"williamboman/mason-lspconfig.nvim",

	"neovim/nvim-lspconfig",

	"hrsh7th/cmp-nvim-lsp",

	"hrsh7th/cmp-buffer",

	"hrsh7th/nvim-cmp",

	"hrsh7th/cmp-vsnip",

	"hrsh7th/vim-vsnip",

	-- git
	"tpope/vim-fugitive",

	"airblade/vim-gitgutter",

	-- golang
	{ "fatih/vim-go", build = ":GoUpdateBinaries" },
}
