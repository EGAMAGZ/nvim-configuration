vim.o.number = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.termguicolors = true

vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc="Change to normal mode" })
vim.keymap.set('n', '<leader>th', "<cmd>horizontal botright terminal<cr>", { desc="Open terminal horizontally"})
vim.keymap.set('n', '<leader>ts', "<cmd>vertical botright terminal<cr>", { desc="Open terminal vertically" })
