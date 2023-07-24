-- This file is automatically loaded by lucynvim.config.init --
-- Prefix character for to ensure there are no collisions on complex binds.
vim.g.mapleader = "<Space>"

-- Alias map to map
local map = vim.keymap.set

-- Explicitly set the mapleader to do nothing.
map("n", "<Space>", "<nop>")

-- Unbind arrow keys (use hjkl)
map({"n", "i", "v"}, "<Left>", "<nop>")
map({"n", "i", "v"}, "<Right>", "<nop>")
map({"n", "i", "v"}, "<Up>", "<nop>")
map({"n", "i", "v"}, "<Down>", "<nop>")

-- Better up & down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Use ; as : to avoid pressing shift every time we need to run a command
--map("n", ";", ":")

-- Swap windows using Ctrl + Direction
map("n", "<C-h>", "<C-w>h", { desc = "Focus on the window to the left", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on the window below", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on the window above", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on the window to the right", remap = true })

-- Resize window using <ctrl> arrow keys
-- Broken due to unbinding?
--map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
--map("n", "<leader>j", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
--map("n", "<leader>k", "<cmd>resize +2<cr>", { desc = "Increase window height" })
--map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Unbind Ex-mode (batch processing is not useful for us right now and accidentally pressing this is annoying)
map("n", "Q", "<nop>")

-- Reload LSP
map("n", "<leader>L", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:edit<CR>")


-- Create restore points in undo.
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Tab blocks of text from visual mode
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Move lines up and down
map("n", "<S-K>", ":m-2<CR>")
map("n", "<S-J>", ":m+<CR>")
