require("which-key").setup {
	preset = "helix"
}

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global =true })
end)
