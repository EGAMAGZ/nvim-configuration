vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Dependencies
	use 'nvim-tree/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { 
			{'nvim-lua/plenary.nvim'},
			{"BurntSushi/ripgrep"},
			{"sharkdp/fd"}
		}
	}

	-- Colorschema
	use { 
		"catppuccin/nvim", as = "catppuccin"
	}

	-- Statusline
	use {
		'romgrk/barbar.nvim',
		requires = {
			{ 'lewis6991/gitsigns.nvim', opt = true},
			{ 'nvim-tree/nvim-web-devicons', opt = true}
		}
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Undotree
	use 'mbbill/undotree'
	
	-- Vim fugitive
	use 'tpope/vim-fugitive'

	-- Colorizer
	use 'norcalli/nvim-colorizer.lua'
	-- Lorem ipsum generator
	use 'derektata/lorem.nvim'

	-- LSP
	use {
		'vonheikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'l3mon4d3/luasnip'},
		}
	}
end)
