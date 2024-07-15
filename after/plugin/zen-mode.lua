local zen_mode = require("zen-mode")

zen_mode.setup{
	plugins = {
		gitsigns = {
			enabled=true
		}
	}
}

vim.keymap.set("n", 'zn', zen_mode.toggle)
