return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },

  config = function()
    require('package-info').setup()

    vim.api.nvim_set_keymap('n', '<leader>pi', "<cmd>lua require('package-info').show({ force = true })<cr>", {
      silent = true,
      noremap = true,
      desc = '[P]ackage [I]nfo',
    })
  end,
}
