return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function() return {} end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    -- @param opts cmp.ConfigSchema
    opts = function(_, _) -- We're intentionally ignoring the passed 'opts' for now
      local opts = {} -- Create a new empty table
      vim.inspect(opts)

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      local luasnip = require "luasnip"
      local cmp = require "cmp"

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, { -- Initialize opts.mapping if it's nil
        ["<CR>"] = cmp.config.disable,
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-j>"] = cmp.mapping(function(fallback) end, { "i", "s" }),
      })

      return opts
    end,
  },
}
