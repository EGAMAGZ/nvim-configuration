vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

vim.cmd [[packadd packer.nvim]]


local packer = require('packer')

packer.init {
	max_jobs = 1
}

return packer.startup(function(use)
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

	-- Colorscheme
	use { 
		"catppuccin/nvim", as = "catppuccin"
	}

	use "dgox16/oldworld.nvim"

	use "alexxGmZ/e-ink.nvim"

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

	-- Nvim-tree (File explorer)
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Vim fugitive (Git panel)
	use 'tpope/vim-fugitive'

	use {
		'isakbm/gitgraph.nvim',
		requires = { {'sindrets/diffview.nvim'} },
	}

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

	-- Zen mode
	use "folke/zen-mode.nvim"

	-- Notify (Notifications)
	use 'rcarriga/nvim-notify'

	-- Floating command line
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
		branch = 'v4.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'l3mon4d3/luasnip'},
		}
	}

	-- Gleam LSP
	use 'gleam-lang/gleam.vim'

	-- Inlay Hints
	use {
		"MysticalDevil/inlay-hints.nvim",
		requires = {
			{'neovim/nvim-lspconfig'}
		},
	}

	-- Inlay diagnostics
	use "rachartier/tiny-inline-diagnostic.nvim"

	-- Display blank lines
	use "lukas-reineke/indent-blankline.nvim"

	-- Refactoring

	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"}
		}
	}

	-- Markview
	use {
		"OXY2DEV/markview.nvim",
		requires = {
			{"nvim-treesitter/nvim-treesitter"},
			{"nvim-tree/nvim-web-devicons"}
		}
	}

	-- Unit converter
	use {
		"atiladefreitas/tinyunit",
		config = function()
			require("tinyunit").setup({
				-- your custom config here (optional)
			})
		end,
	}

	-- Color picker
	use {
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
		requires = {
			{"nvzone/volt"}
		}
	}

	-- Discord Activity
	use 'IogaMaster/neocord'

	-- Animations
	use {
		'sphamba/smear-cursor.nvim',
		config = function()
			require("smear_cursor").setup()
			require("smear_cursor").enabled = true
		end
	}

end)
