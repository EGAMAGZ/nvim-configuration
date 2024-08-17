local zen_mode = require("zen-mode")

zen_mode.setup{
	window= {
		options = {
			number = false
		}
	},
	plugins = {
		gitsigns = {
			enabled=true
		}
	}
}

vim.keymap.set("n", 'zn', zen_mode.toggle, { desc = "Toggle Zen mode of the current buffer" })
