local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd("BufWritePre", {
	group = augroup("RemoveWhitespaceOnSave", { clear = true }),
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Tab width configuration
autocmd("FileType", {
	group = augroup("TabWidthConfig", { clear = true }),
	pattern = {
		"html",
		"htmldjango",
		"css",
		"scss",
		"yaml",
		"vim",
		"json",
		"javascript",
		"typescript",
		"typescriptreact",
		"lua",
    "gohtmltmpl",
    "cpp",
	},
	callback = function(_e)
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})

-- golang tab configuration
autocmd("FileType", {
	group = augroup("GoTabConfig", { clear = true }),
	pattern = "go",
	callback = function(_e)
		vim.bo.expandtab = false
	end,
})
