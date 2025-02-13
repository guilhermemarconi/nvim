function SetColorScheme(color)
	color = color or 'catppuccin-mocha'
	vim.cmd.colorscheme(color)
end

SetColorScheme()
