return {
  -- Add the solarized-osaka color scheme
  {
    "catppuccin/nvim",
    lazy = true, -- Load this plugin lazily
    priority = 1000, -- Ensure this plugin is loaded early
    opts = function()
      return {
        transparent = true, -- Enable transparency
      }
    end,
  },
}
