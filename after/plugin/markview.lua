vim.keymap.set("n", "<leader>mvt", function() vim.cmd[[Markview splitToggle]] end, { desc="Toggles splitview (Markview)" })
vim.keymap.set("n", "<leader>mvr", function() vim.cmd[[Markview splitRedraw]] end, { desc="Redraws splitview (Markview)" })
