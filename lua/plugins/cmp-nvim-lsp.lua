return {
  "hrsh7th/cmp-nvim-lsp",
  -- Optionally, you can include a config function to customize the setup
  -- if needed.
  config = function()
    require("cmp_nvim_lsp").setup() -- This is a basic setup
  end,
}
