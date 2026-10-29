-- On hover, it creates a floating window for the error message.
-- TypeScript can have long error messages, helps with it.
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      if vim.api.nvim_get_mode().mode == "n" then
        vim.diagnostic.open_float(nil, { focusable = false })
      end
    end,
  })
