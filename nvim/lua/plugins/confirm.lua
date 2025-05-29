-- Plugin configuration for conform.nvim, a code formatting plugin for Neovim.
-- This table specifies the plugin source and its options.

return {
  'stevearc/conform.nvim', -- The plugin repository for conform.nvim
  opts = {
    formatters_by_ft = {
      -- For HTML files, use both 'prettier' and 'html_beautify' as formatters.
      html = { 'prettier', 'html_beautify' },
    },
  },
}
