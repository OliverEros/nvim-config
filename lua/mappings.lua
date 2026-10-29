require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<Esc>", "<Esc><Esc>")


-- Diagnostics in the current file
map("n", "<leader>td", "<cmd>Telescope diagnostics bufnr=0<CR>", {
  desc = "Diagnostics: Current File",
})

-- Diagnostics across the whole workspace/project
map("n", "<leader>tD", "<cmd>Telescope diagnostics<CR>", {
  desc = "Diagnostics: Workspace",
})


