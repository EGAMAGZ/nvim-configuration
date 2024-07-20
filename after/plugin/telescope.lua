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


vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc="List files in the current working directory, respects .gitignore" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc="Fuzzy search through the output of git ls-files command, respects .gitignore"})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search for the string under the current working directory"})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc="List references for word under the cursor"})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc="List diagnostics for all open buffers"})
