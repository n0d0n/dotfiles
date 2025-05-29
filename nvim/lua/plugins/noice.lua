--[[
  Plugin configuration for noice.nvim, a Neovim plugin that enhances the command-line
  and message UI experience. This file sets up basic options and presets for the plugin.
--]]

return {
  "folke/noice.nvim", -- The plugin repository for noice.nvim

  -- Configuration function to set up noice.nvim with custom options
  config = function()
    require("noice").setup({
      cmdline = {
        view = "cmdline", -- Use the default command-line view for input
      },
      presets = {
        bottom_search = true,   -- Show search at the bottom of the screen
        command_palette = true, -- Enable command palette UI
        lsp_doc_border = true,  -- Add a border to LSP documentation popups
      },
      -- Note: Additional configuration fields are available (e.g., messages, popupmenu, lsp, etc.)
      -- See :help noice.nvim-configuration for more options.
    })
  end,
}
