return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    --- required
    harpoon:setup()
    --- required

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon: [A]dd to list' })

    vim.keymap.set('n', '<leader>ht', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon: [T]oggle list' })

    -- vim.keymap.set("n", "<C-h>", function()
    --   harpoon:list():select(1)
    -- end)

    -- vim.keymap.set("n", "<C-j>", function()
    --   harpoon:list():select(2)
    -- end)

    -- vim.keymap.set("n", "<C-k>", function()
    --   harpoon:list():select(3)
    -- end)

    -- vim.keymap.set("n", "<C-l>", function()
    --   harpoon:list():select(4)
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hgp', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon: [G]o to [P]revious buffer' })

    vim.keymap.set('n', '<leader>hgn', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon: [G]o to [N]ext buffer' })
  end,
}
