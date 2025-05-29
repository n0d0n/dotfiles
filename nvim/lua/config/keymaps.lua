-- Key mappings for improved navigation and plugin integration in Neovim

-- Cycle to the next buffer using <TAB> in normal mode
vim.keymap.set("n", "<TAB>", "<CMD>:BufferLineCycleNext<CR>", { desc = "Cycle buffers" })

-- Move half a page up and center the cursor line with <C-u> in normal mode
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })

-- Move half a page down and center the cursor line with <C-d> in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })

-- Search for a string in files using Telescope's live_grep with <leader>gg in normal mode
vim.keymap.set("n", "<leader>gg", require("telescope.builtin").live_grep, { desc = "Grep for files" })

-- Open the parent directory using Oil.nvim with - in normal mode
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
