vim.keymap.set('n', '<leader>gg', function()
        require('gitgraph').draw({}, { all = true, max_count = 5000 })
end, { desc = 'Open Git Graph panel' })
