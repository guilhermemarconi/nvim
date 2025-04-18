return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    animation = { enabled = true },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    dim = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true, timeout = 0 },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    ---@diagnostic disable-next-line: undefined-global
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
}
