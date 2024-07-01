vim.o.number = true
vim.o.wrap = false
vim.o.cursorline = true

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

-- Catppuccin Theme
local function save_colorscheme(colorscheme)
	local file = io.open(vim.fn.stdpath("data") .. "/colorscheme", "w")

	if file then
		file:write(colorscheme)
		file:close()
	end
end

local function load_colorscheme()
	local file = io.open(vim.fn.stdpath("data") .. "/colorscheme", "r")

	if file then
		local colorscheme = file:read("*all")
		file:close()
		return colorscheme
	end

	return nil
end

function toggle_colorscheme()
	local current_colorscheme = vim.g.colors_name

	local light_colorscheme = 'catppuccin-latte'
	local dark_colorscheme = 'catppuccin-mocha'

	if current_colorscheme == dark_colorscheme then
		vim.g.current_colorscheme = light_colorscheme
	else
		vim.g.current_colorscheme = dark_colorscheme
	end

	current_colorscheme = vim.g.current_colorscheme

	vim.cmd('colorscheme ' .. current_colorscheme)
	save_colorscheme(current_colorscheme)
end

vim.keymap.set('n', '<leader>tt', toggle_colorscheme)

vim.g.current_colorscheme = load_colorscheme() or "catppuccin-mocha"
vim.cmd('colorscheme ' .. vim.g.current_colorscheme)

-- Telescope config

require('telescope').setup{ 
  defaults = { 
vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NvimTree (File Explorer) Config
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>')

-- Lualine (Status line)
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

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
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

-- GitSigns (Git integration)
require('gitsigns').setup()

-- Colorizer
require('colorizer').setup()


require("lorem").setup()
