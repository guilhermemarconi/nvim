return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    local oil = require 'oil'

    oil.setup {
      columna = { 'icon' },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open Oil' })
  end,
}
