require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "markdown", "markdown_inline", "latex" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
