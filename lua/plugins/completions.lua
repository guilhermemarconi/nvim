return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    run = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        sources = {
          -- { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        snippet = {
          expand = function(args)
            -- vim.snippet.expand(args.body)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-a>"] = function()
            if cmp.visible() then
              cmp.close()
            else
              cmp.complete()
            end
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        preselect = cmp.PreselectMode.Item,
        completion = { completeopt = "menu,menuone,noinsert" },
      })
    end,
  },
}
