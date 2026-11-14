-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.env.GHOSTTY_RESOURCES_DIR then
  vim.env.SNACKS_GHOSTTY = "true"
end
