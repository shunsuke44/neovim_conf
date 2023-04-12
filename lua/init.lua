local on_attach = function(client, bufnr)
	-- LSPサーバーのフォーマット機能を無効にする
	client.server_capabilities.documentFormattingProvider = false
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(args.buf, ...)
    end

    local opts = {noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    -- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    -- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>m", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opts)
  end
})

local lspconfig = require("lspconfig")
require("mason").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local mason_lspconfig = require("mason-lspconfig")
local custom_settings = require("custom_lsp_settings")
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup(custom_settings.get_custom_setups(server_name, on_attach, capabilities))
	end,
})

-- completion settings
-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	preselect = cmp.PreselectMode.None,
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

require("toggleterm").setup({
	open_mapping = [[<c-t><c-t>]],
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort.with({
			extra_args = { "--profile", "black" },
		}),
		null_ls.builtins.diagnostics.flake8.with({
			extra_args = { "--max-line-length", "88", "--extend-ignore=E203" },
		}),
		null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rubocop,
	},
})

require("Comment").setup()
