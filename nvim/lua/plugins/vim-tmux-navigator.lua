--[[
  Plugin configuration for vim-tmux-navigator, a Neovim plugin that enables seamless
  navigation between tmux panes and Neovim splits using familiar keybindings.
  This file specifies which commands and key mappings are available for quick navigation.
--]]

return {
  "christoomey/vim-tmux-navigator", -- The plugin repository for vim-tmux-navigator

  -- List of commands provided by the plugin for pane navigation
  cmd = {
    "TmuxNavigateLeft",        -- Move focus to the left pane
    "TmuxNavigateDown",        -- Move focus to the pane below
    "TmuxNavigateUp",          -- Move focus to the pane above
    "TmuxNavigateRight",       -- Move focus to the right pane
    "TmuxNavigatePrevious",    -- Move focus to the previously active pane
    "TmuxNavigatorProcessList" -- Show the list of processes in tmux panes
  },

  -- Key mappings for quick pane navigation using Ctrl + Arrow keys
  keys = {
    { "<c-Left>",  "<cmd>TmuxNavigateLeft<cr>" },     -- Ctrl+Left: Move left
    { "<C-Down>",  "<cmd>TmuxNavigateDown<cr>" },     -- Ctrl+Down: Move down
    { "<C-Up>",    "<cmd>TmuxNavigateUp<cr>" },       -- Ctrl+Up: Move up
    { "<C-Right>", "<cmd>TmuxNavigateRight<cr>" },    -- Ctrl+Right: Move right
    { "<C-\\>",    "<cmd>TmuxNavigatePrevious<cr>" }, -- Ctrl+\: Move to previous pane
  },
}
