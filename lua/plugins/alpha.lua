return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require 'alpha.themes.startify'

    local ascii_art = {
      '_________________ ____________  __                    ',
      '__  ____/___  __ \\___  ____/_ \\/ /                    ',
      '_  / __  __  /_/ /__  __/   __  /                     ',
      '/ /_/ /  _  _, _/ _  /___   _  /                      ',
      '\\____/   /_/ |_|  /_____/   /_/                       ',
      '                                                      ',
      '___       _________ ______ ___    ____________________',
      '__ |     / /__  __ \\___  / __ |  / /___  ____/__  ___/',
      '__ | /| / / _  / / /__  /  __ | / / __  __/   _____ \\ ',
      '__ |/ |/ /  / /_/ / _  /_____ |/ /  _  /___   ____/ / ',
      '____/|__/   \\____/  /_____/_____/   /_____/   /____/  ',
      '                                                      ',
    }

    -- Set the header
    dashboard.section.header.val = ascii_art
    require('alpha').setup(dashboard.config)
  end,
}
