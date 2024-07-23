vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Icons 
	use 'nvim-tree/nvim-web-devicons'

	-- Git
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

	-- Barbecue (Winbar vscode-like)
	use{
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("barbecue").setup()
		end,
	}

	-- Nvim-tree (File explorer)
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	
	-- Vim fugitive (Git panel)
	use 'tpope/vim-fugitive'

	-- Colorizer
	use 'norcalli/nvim-colorizer.lua'

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	-- Lorem ipsum generator
	use 'derektata/lorem.nvim'

	-- Zen mode
	use "folke/zen-mode.nvim"

	-- Indent Lines
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end
	}

	-- Notify (Notifications)
	use 'rcarriga/nvim-notify'

	-- Discord Presence
	use 'IogaMaster/neocord'

	use  {
		'VonHeikemen/fine-cmdline.nvim',
		requires = {

			{'MunifTanjim/nui.nvim'}
		}
	}

	-- Which Key
	use "folke/which-key.nvim"

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
