return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    -- Safely initialize mapping table if it doesn't exist
    opts.mapping = opts.mapping or {}

    -- Inject the single-press Esc fix
    opts.mapping["<Esc>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
      end
      fallback()
    end, { "i", "s" })
  end,
}

