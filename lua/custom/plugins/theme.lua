return {
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        -- configurations
      }

      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
}
