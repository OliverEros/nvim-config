-- Configuration for mfussenegger/nvim-lint
-- An asynchronous linting plugin that checks code for syntax errors and bugs
-- Automatically triggers ESLint on save or when exiting insert mode
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
      }

      vim.api.nvim_create_autocmd({
        "BufEnter",
        "BufWritePost",
        "InsertLeave",
      }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
