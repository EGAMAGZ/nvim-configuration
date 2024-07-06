local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)

	lsp_zero.default_keymaps({buffer = bufnr})

	vim.keymap.set("n", '<leader>.',vim.lsp.buf.code_action)
	vim.keymap.set("n", '<S-A-f>', vim.lsp.buf.format)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	"pyright",
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
