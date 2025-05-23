return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection

    hop.setup()

    vim.keymap.set('', 'f', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, {
      remap = true,
      desc = 'Hop: Find char after cursor',
    })

    vim.keymap.set('', 'F', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, {
      remap = true,
      desc = 'Hop: Find char before cursor',
    })

    vim.keymap.set('', 't', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
    end, {
      remap = true,
      desc = "Hop: Move 'till char",
    })

    vim.keymap.set('', 'T', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
    end, {
      remap = true,
      desc = "Hop: Move back 'till char",
    })

    vim.keymap.set('n', '<leader>m', function()
      hop.hint_char1 {
        multi_windows = true,
      }
    end, { desc = 'Hop: [M]ove to...' })
  end,
}
