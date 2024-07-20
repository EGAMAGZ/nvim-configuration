require("gitsigns").setup {

	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		vim.keymap.set('n','<leader>gb', gitsigns.toggle_current_line_blame, {desc="Toggles git blame for the current line"})
	end,
	current_line_blame = true,
	current_line_blame_opt = {
		delay = 300,
		virt_text_pos = "overlay"
	}
}
