return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
    config = function()
      local oil = require("oil")

      oil.setup({
        columns = { "icon" },
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", oil.toggle_float, { desc = "Open Oil" })
    end,
  },
}
