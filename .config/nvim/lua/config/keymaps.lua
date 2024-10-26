-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<cr>", "o")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "Q", "<cmd>q<cr><esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-a>", "GVgg")
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rw", vim.lsp.buf.rename) -- smart rename
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>") -- mapping to restart lsp if necessary
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>") -- mapping to restart lsp if necessary
