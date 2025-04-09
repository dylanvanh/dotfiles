return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      if opts.defaults then
        opts.defaults["<leader>a"] = { name = "󱚣 +augment" }
      else
        opts.defaults = {
          ["<leader>a"] = { name = "󱚣 +augment" }
        }
      end
    end,
  },
}
