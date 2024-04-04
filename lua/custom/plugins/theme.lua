return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    name = 'lualine',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        color_overrides = {
          all = {
            base = '#000000',
          },
        },
      }

      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
