local function get_custom_settings(server_name)
  if server_name == "pylsp" then
    return {
      pylsp = {
        configurationSources = {"flake8"},
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
    }
  else
    return {}
  end
end

return {
  get_custom_settings = get_custom_settings,
}
