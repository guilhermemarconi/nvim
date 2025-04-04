return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fh", builtin.find_files, { desc = "Telescope find help" })

      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })

      vim.keymap.set("n", "<leader>nc", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
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
