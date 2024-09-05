return {
  -- Add the solarized-osaka color scheme
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true, -- Load this plugin lazily
    priority = 1000, -- Ensure this plugin is loaded early
    opts = function()
      return {
        transparent = true, -- Enable transparency
      }
    end,
  },
}
