-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap("n", "<leader>cD", function()
  local bib = Doi2bib(vim.api.nvim_get_current_line())

  vim.api.nvim_set_current_line(bib)
end, { desc = "doi2bib" })
