require("settings")

-- Plugins
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme Catppuccin https://github.com/catppuccin/nvim
Plug('catppuccin/nvim', { as = 'catppuccin' })
-- Tabline https://github.com/romgrk/barbar.nvim
Plug('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
Plug('romgrk/barbar.nvim')

-- File Explorer
Plug('nvim-tree/nvim-web-devicons') -- optional (Usado por nvim-tree, tabline y lualine)
Plug('nvim-tree/nvim-tree.lua')

-- Statusline https://github.com/nvim-lualine/lualine.nvim
Plug('nvim-lualine/lualine.nvim')

-- Telescope (Fuzzy Finder)
Plug('nvim-lua/plenary.nvim')
Plug("BurntSushi/ripgrep")
Plug("sharkdp/fd")
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.x' })

-- Mason (LSP) https://github.com/williamboman/mason.nvim
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

-- Colorizer
Plug('norcalli/nvim-colorizer.lua')

-- Lorem ipsum
Plug('derektata/lorem.nvim')

vim.call('plug#end')



-- NvimTree (File Explorer) Config
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>')

-- Lualine (Status line)
require('lualine').setup()

-- Mason (LSP)
require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {
		"pyright",
		"denols"
	}
}

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm{ 
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		},
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },     
		}, 
		{
		{ name = 'buffer' }
	})
})

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.denols.setup {
	  on_attach = on_attach,
	  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
	  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
	  on_attach = on_attach,
	  root_dir = nvim_lsp.util.root_pattern("package.json"),
	  single_file_support = false,
	  capabilities = capabilities
}

nvim_lsp.pyright.setup({
	capabilities= capabilities
})

nvim_lsp.sqlls.setup({
	capabilities= capabilities
})

nvim_lsp.ruff.setup({
	capabilities= capabilities
})

nvim_lsp.ruff_lsp.setup({
	capabilities= capabilities
})

nvim_lsp.tailwindcss.setup({
	capabilities= capabilities
})

nvim_lsp.cssls.setup({
	capabilities= capabilities
})

nvim_lsp.astro.setup({
	capabilities= capabilities
})

nvim_lsp.emmet_language_server.setup({
	capabilities= capabilities
})

-- GitSigns (Git integration)
require('gitsigns').setup {
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		vim.keymap.set('n','<leader>tb', gitsigns.toggle_current_line_blame)
	end
}



-- Colorizer
require('colorizer').setup()


require("lorem").setup()
