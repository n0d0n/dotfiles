--[[
  Plugin configuration for lazygit.nvim, a Neovim plugin that provides an interface
  to the LazyGit terminal UI for git operations. This file specifies how and when
  the plugin should be loaded, its dependencies, and key mappings for quick access.
--]]

return {
  "kdheepak/lazygit.nvim", -- The plugin repository for lazygit.nvim

  -- Commands that will trigger loading of this plugin
  cmd = {
    "LazyGit",                  -- Open LazyGit UI
    "LazyGitConfig",            -- Open LazyGit configuration
    "LazyGitCurrentFile",       -- Open LazyGit for the current file
    "LazyGitFilter",            -- Open LazyGit with filter options
    "LazyGitFilterCurrentFile", -- Open LazyGit filter for the current file
  },

  -- Required dependencies for this plugin to work
  dependencies = {
    "nvim-lua/plenary.nvim", -- Utility functions used by many plugins
  },

  -- Key mappings for quick access to LazyGit
  keys = {
    { "<leader>go", "<cmd>LazyGit<cr>", desc = "Open lazy git" }, -- <leader>go opens LazyGit UI
  },
}
