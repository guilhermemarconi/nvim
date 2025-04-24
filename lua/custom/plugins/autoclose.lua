return {
  'm4xshen/autoclose.nvim',
  config = function()
    require('autoclose').setup {
      options = {
        pair_spaces = true,
      },
      keys = {
        -- ['---'] = { escape = false, close = true, pair = '---\n\n---\n\n' },
      },
    }
  end,
}
