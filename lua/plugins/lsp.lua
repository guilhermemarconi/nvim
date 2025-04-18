return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.astro.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gh", vim.lsp.buf.hover, vim.tbl_flatten(opts, { desc = "LSP: [H]over" }))

          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            vim.tbl_flatten(opts, { dsc = "LSP: [G]o to [D]efinition" })
          )

          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            vim.tbl_flatten(opts, { desc = "LSP: [G]o to [D]eclaration" })
          )

          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            vim.tbl_flatten(opts, { desc = "LSP: [G]o to [I]mplementation" })
          )

          vim.keymap.set(
            "n",
            "gt",
            vim.lsp.buf.type_definition,
            vim.tbl_flatten(opts, { desc = "LSP: [G]o to [T]ype definition" })
          )

          vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            vim.tbl_flatten(opts, { desc = "LSP: [G]o to [R]eferences" })
          )

          vim.keymap.set(
            "n",
            "gs",
            vim.lsp.buf.signature_help,
            vim.tbl_flatten(opts, { desc = "LSP: [G]o to [S]ignature" })
          )

          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, vim.tbl_flatten(opts, { desc = "LSP: [R]ename" }))

          vim.keymap.set(
            { "n", "x" },
            "<leader>f",
            vim.lsp.buf.format,
            vim.tbl_flatten(opts, { desc = "LSP: [F]ormat" })
          )

          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            vim.tbl_flatten(opts, { desc = "LSP: [C]ode [A]ction" })
          )
        end,
      })
    end,
  },
}
