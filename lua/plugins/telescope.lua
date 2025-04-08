return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local additional_rg_args = { "rg", "--files", "--hidden", "--glob", "!**/node_modules/*" }

      telescope.setup({
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            live_grep = {
              additional_args = vim.tbl_flatten({
                additional_rg_args,
                { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
              }),
            },
            grep_string = { additional_args = additional_rg_args },
          },
        },
        extensions = {
          fzf = {},
        },
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope find help" })
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })

      vim.keymap.set("n", "<leader>nc", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
