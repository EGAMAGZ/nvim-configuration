require('refactoring').setup{
}
vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end, {desc="Extract function"})
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end, {desc="Extract function to file"})
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, {desc="Extract variable"})
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end, {desc="Inline function"})
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, {desc="Inline variable"})
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end, {desc="Extract block"})
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end, {desc="Extract block to file"})


-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set(
	"n",
	"<leader>rp",
	function() require('refactoring').debug.printf({below = false}) end,
	{desc="Debug print"}
)

-- Print var

vim.keymap.set({"x", "n"}, "<leader>rv", function() require('refactoring').debug.print_var() end, {desc="Print variable"})
-- Supports both visual and normal mode

vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end, {desc="Cleanup"})
-- Supports only normal mode

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")
-- Extract block supports only normal mode
vim.keymap.set(
	{"n", "x"},
	"<leader>rr",
	function() require('telescope').extensions.refactoring.refactors() end,
	{desc="Refactors selection"}
)
