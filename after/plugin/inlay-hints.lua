require('inlay-hints').setup{
	commands = { enable = true },
	autocmd = { enable = true }
}

vim.keymap.set('n', '<leader>ih', function() vim.cmd[[InlayHintsToggle]] end, { desc="Toggle Inlay hints" })
