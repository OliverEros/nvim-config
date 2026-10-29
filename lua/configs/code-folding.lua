-- Enables folding for functions/blocks.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.tsx",
  callback = function()
    vim.schedule(function()
      vim.cmd("normal! zx")
    end)
  end,
})
