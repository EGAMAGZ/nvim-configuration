require("catppuccin").setup {
	show_end_of_buffer=false,
	integrations = {
		cmp = true,
		gitsigns = true,
		barbar =true,
		notify=true,
		mason=true,
		indent_blankline = {
			enabled = true,
			scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = true,
		},
		which_key = false,
		barbecue = {
			dim_dirname = true, -- directory name is dimmed by default
			bold_basename = true,
			dim_context = false,
			alt_background = false,
		},
		telescope = {
			enabled=true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	}
}

require("oldworld").setup{
	integrations = {
		cmp=true,
		gitsigns=true,
		indent_blankline=true,
		lsp=true,
		telescope=true,
		notify=true,
		markdown=true,
		mason=true,
	}
}

require("binary").setup{}
