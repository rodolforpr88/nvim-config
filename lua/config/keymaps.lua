-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- fecha só o buffer atual
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close buffer (alias for <leader>bd)" })
