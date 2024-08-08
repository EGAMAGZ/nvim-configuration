require("gitsigns").setup {

	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		vim.keymap.set('n','<leader>gb', gitsigns.toggle_current_line_blame, {desc="Toggles git blame for the current line"})
	end,
	current_line_blame = true,
	current_line_blame_opt = {
		delay = 300,
		virt_text_pos = "overlay"
	}
}

vim.keymap.set("n", '<leader>gp', function() vim.cmd[[Git push]] end, { desc="Push commits" })
vim.keymap.set("n",'<leader>gc', function() 
	local message = vim.fn.input("Message > ")
	vim.cmd('Git commit -m "' .. message..'"')
end, { desc="Record changes to the repository" })
vim.keymap.set("n", '<leader>ga', function()
	local path = vim.fn.expand('%p')
	vim.cmd("Git add "..path)
end, {desc="Add current changes to the working directory"})
vim.keymap.set("n", '<leader>gA', function() 
	vim.cmd[[Git add .]]
end, {desc="Add all changes to the working directory"})
vim.keymap.set("n", '<leader>gu', function()
	local path = vim.fn.expand('%p')
	vim.cmd("Git restore --staged ".. path)
end, { desc="Unstage current changes from the working directory" })
