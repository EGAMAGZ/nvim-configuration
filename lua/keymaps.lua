-- Keymaps for native API
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc="Change to normal mode" })
vim.keymap.set('n', '<leader>th', "<cmd>horizontal botright terminal<cr>", { desc="Open terminal horizontally"})
vim.keymap.set('n', '<leader>ts', "<cmd>vertical botright terminal<cr>", { desc="Open terminal vertically" })

-- Keymaps for Esc alternatives
vim.keymap.set('i', '<leader>nm', function() vim.cmd[[stopinsert]] end, { desc="Change to normal mode"})
vim.keymap.set('v', '<leader>nm', '<Esc>', { desc="Change to normal mode"})
vim.keymap.set('n', '<leader>nm', '<Esc>', { desc="Change to normal mode (From insert or visual)"})
