local function get_custom_setups(server_name, on_attach, capabilities)
	if server_name == "pylsp" then
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				pylsp = {
					configurationSources = { "flake8" },
					plugins = {
						autopep8 = {
							enabled = false,
						},
						flake8 = {
							enabled = true,
							maxLineLength = 88,
						},
						pyflakes = {
							enabled = false,
						},
						pycodestyle = {
							enabled = false,
						},
					},
				},
			},
		}
	elseif server_name == "lua_ls" then
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}
	else
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end
end

return {
	get_custom_setups = get_custom_setups,
}
