return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()

    -- mappings
    local wk = require 'which-key'

    wk.register({
      e = {
        name = 'Go Features',
        d = { '<cmd>GoDoc<cr>', 'GoDoc' },
        c = { '<cmd>GoCmt<cr>', 'GoCmt' },
        t = { '<cmd>GoModTidy<cr>', 'GoModTidy' },
        l = { '<cmd>GoLint<cr>', 'GoLint' },
        f = { '<cmd>GoFmt<cr>', 'GoFmt' },
      },
    }, { prefix = '<leader>' })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
