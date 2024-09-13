require("lorem").opts{
	sentenceLength = {
		words_per_sentence = 8,
		sentences_per_paragraph = 6
	},
}

function generate_lorem(message, mode)
	local number = vim.fn.input(message.." > ")

	if type(number) == "number" and number >= 1 then
		vim.cmd("Lorem "..number.." "..mode)
	else
		vim.print("Please insert a valid number")
	end
end

vim.keymap.set('n', '<leader>lp',function()
	generate_lorem("Number of Paragraphs", "paragraphs")
end, { desc="Generate N number of paragraphs" })

vim.keymap.set('n', '<leader>lw',function()
	generate_lorem("Number of Words", "words")
end, { desc="Generate N number of paragraphs" })
