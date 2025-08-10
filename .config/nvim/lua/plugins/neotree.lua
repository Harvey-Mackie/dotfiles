return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",  -- Ensure this is included
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "",  -- Custom folder icon (from Nerd Fonts)
          folder_open = "",    -- Custom open folder icon (from Nerd Fonts)
          folder_empty = "",
          default = "",        -- Default file icon
        },
      },
    },
  },
}
