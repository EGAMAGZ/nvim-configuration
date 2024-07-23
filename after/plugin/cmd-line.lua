require("fine-cmdline").setup()

vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true, desc="Open floating command line"})
vim.keymap.set('n', '<C-k>', '<cmd>FineCmdline<CR>', {noremap = true, desc="Open floating command line"})
