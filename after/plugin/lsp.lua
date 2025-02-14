local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)

	lsp_zero.default_keymaps({buffer = bufnr, exclude={'<F4>', '<F3>'}})

	vim.keymap.set("n", '<leader>.',vim.lsp.buf.code_action, { desc = "Selects a code action available at the current cursor position"})
	vim.keymap.set("n", '<S-A-f>', vim.lsp.buf.format, { desc = "Format code in current buffer" })
end)

local nvim_lsp = require("lspconfig")

require('mason').setup({})
require('mason-lspconfig').setup {
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		ts_ls = function ()
			require('lspconfig').ts_ls.setup{
				single_file_support = false,
				root_dir = nvim_lsp.util.root_pattern("package.json"),
				-- Inlay hints' settings
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				}
			}
		end,
		denols = function()
			require('lspconfig').denols.setup{
				root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),	
				-- Inlay hints' settings
				settings = {
					deno = {
						inlayHints = {
							parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enable = true },
							enumMemberValues = { enabled = true },
						},
					}
				}
			}
		end,
	},
}

nvim_lsp.gleam.setup({})

vim.keymap.set("n", "<leader>m", function() vim.cmd[[Mason]] end, { desc="Open LSP package manager (Mason)" })
