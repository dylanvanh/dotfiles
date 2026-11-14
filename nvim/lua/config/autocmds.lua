-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(event)
    if vim.bo[event.buf].filetype ~= "image" then
      return
    end

    require("snacks.image.buf").attach(event.buf)
  end,
})
