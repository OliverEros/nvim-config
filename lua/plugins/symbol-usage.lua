-- symbol-usage.nvim: Displays LSP references, definitions, and implementations as virtual text (like JetBrains/VS Code CodeLens).
return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach", -- Only load when LSP is active
    config = function()
      require("symbol-usage").setup()
    end,
  },
}
