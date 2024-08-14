local nvim_battery = {
	function()
		return require("battery").get_status_line()
	end,
}

local gitcommit_extension = {
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
		lualine_b = {'branch'},
	},
	filetypes = {'gitcommit'}
}

require("lualine").setup {
	options = {
		theme = "catppuccin",
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {
			{'encoding', show_bomb=true}, 
			{'filetype', icon_only=true}
		},
		lualine_y = {},
		lualine_z = {
			'location', 
			nvim_battery, 
			{
				'os.date("%a %d %b %H:%M")', 
				separator = { right = '' }, 
				left_padding = 2 
			}
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {"mason","fugitive", "nvim-tree", gitcommit_extension }
}
