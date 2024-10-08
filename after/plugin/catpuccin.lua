local default_colorscheme = "catppuccin-mocha"

local function save_colorscheme(colorscheme)
	local file = io.open(vim.fn.stdpath("data") .. "/colorscheme", "w")

	if file then
		file:write(colorscheme)
		file:close()
	end
end

local function load_colorscheme()
	local file = io.open(vim.fn.stdpath("data") .. "/colorscheme", "r")

	if file then
		local colorscheme = file:read("*all")
		file:close()
		return colorscheme
	end

	return nil
end

function toggle_colorscheme()
	local current_colorscheme = vim.g.colors_name

	local light_colorscheme = 'catppuccin-latte'
	local dark_colorscheme = default_colorscheme

	if current_colorscheme == dark_colorscheme then
		vim.g.current_colorscheme = light_colorscheme
	else
		vim.g.current_colorscheme = dark_colorscheme
	end

	current_colorscheme = vim.g.current_colorscheme

	vim.cmd('colorscheme ' .. current_colorscheme)
	save_colorscheme(current_colorscheme)
end

vim.keymap.set('n', '<leader>ct', toggle_colorscheme, { desc="Change between Catpuccin's color theme "})

vim.g.current_colorscheme = load_colorscheme() or default_colorscheme
vim.cmd('colorscheme ' .. vim.g.current_colorscheme)

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
