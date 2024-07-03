local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

local builtin = require("telescope.builtin")

telescope.setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules/",
			".git/",
			".log/"
		},
		vimgrep_arguments = {
		      'rg',
		      '--color=never',
		      '--no-heading',
		      '--with-filename',
		      '--line-number',
		      '--column',
		      '--smart-case',
		      '--ignore-file',
		      '.gitignore'
		},
	}
}


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
