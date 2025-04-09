-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim-tmux-navigator mappings
-- Move to window using the <ctrl> hjkl keys
-- overwrite lazyvim mappings with vim-tmux-navigator mappings
-- see: https://github.com/christoomey/vim-tmux-navigator/blob/master/plugin/tmux_navigator.vim
vim.cmd([[
  noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
]])

-- Augment keybindings
-- <leader>a prefix for Augment commands

-- Augment status
vim.keymap.set("n", "<leader>as", ":Augment status<CR>", { desc = "󰈻 Status" })

-- Augment chat
vim.keymap.set("n", "<leader>ac", ":Augment chat ", { desc = "󰭹 Chat" })

-- Augment chat with visual selection
vim.keymap.set("v", "<leader>ac", ":<C-u>Augment chat ", { desc = "󰭹 Chat with Selection" })

-- Augment chat toggle
vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>", { desc = "󰕮 Chat Toggle" })

-- Augment new chat
vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>", { desc = "󰐕 New Chat" })

-- Augment signin
vim.keymap.set("n", "<leader>ai", ":Augment signin<CR>", { desc = "󰌋 Sign In" })

-- Augment signout
vim.keymap.set("n", "<leader>ao", ":Augment signout<CR>", { desc = "󰍃 Sign Out" })

-- Augment log
vim.keymap.set("n", "<leader>al", ":Augment log<CR>", { desc = "󰘳 Log" })
