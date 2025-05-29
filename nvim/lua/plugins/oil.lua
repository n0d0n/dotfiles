--[[
  Plugin configuration for oil.nvim, a Neovim file explorer that provides a modern
  and extensible interface for navigating and managing files and directories.
  This file specifies plugin options, dependencies, and loading behavior.
--]]

return {
  'stevearc/oil.nvim', -- The plugin repository for oil.nvim

  opts = {
    view_options = {
      show_hidden = true, -- Show hidden files and directories in the file explorer
    }
  },

  dependencies = {
    { "echasnovski/mini.icons", opts = {} }, -- Optional: Adds icon support for a richer UI
  },

  lazy = false, -- Load this plugin immediately (not lazy-loaded)
}
