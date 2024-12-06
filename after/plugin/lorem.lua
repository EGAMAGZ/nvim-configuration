require("lorem").opts{
	sentenceLength = {
		words_per_sentence = 8,
		sentences_per_paragraph = 6
	},
}

function generate_lorem(message, mode)
	local number = vim.fn.input(message.." > ")

	local is_numeric = tonumber(number) ~= nil

	if is_numeric then
		local num = tonumber(number) -- Convert to number
		if num >= 1 then
			if mode == "paragraphs" or mode == "words" then
				vim.cmd(string.format("Lorem %s %s", mode, num))
			else
				vim.print("Invalid mode specified. Use 'words' or 'paragraphs'.")
			end
		else
			vim.print("Please insert a number greater than or equal to 1.")
		end
	else
		vim.print("Please insert a valid number.")
	end
end

vim.keymap.set('n', '<leader>lp',function()
	generate_lorem("Number of Paragraphs", "paragraphs")
end, { desc="Generate N number of paragraphs" })

vim.keymap.set('n', '<leader>lw',function()
	generate_lorem("Number of Words", "words")
end, { desc="Generate N number of words" })
