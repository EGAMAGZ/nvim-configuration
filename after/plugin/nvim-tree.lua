require("nvim-tree").setup {}

vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle, { desc="Open or close the tree" })
vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFocus, { desc="Open the tree if it is closed, and then focus on the tree" })
