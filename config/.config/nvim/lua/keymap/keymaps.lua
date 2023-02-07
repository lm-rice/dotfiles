-- Prefix character for to ensure there are no collisions on complex binds.
vim.g.mapleader = "<Space>"

-- Explicitly set the map leader to do nothing.
vim.keymap.set("n", "<Space>", "<nop>")

-- Unbind arrow keys (they are annoying, just use hjkl)
vim.keymap.set({"n", "i", "v"}, "<Left>", "<nop>")
vim.keymap.set({"n", "i", "v"}, "<Right>", "<nop>")
vim.keymap.set({"n", "i", "v"}, "<Up>", "<nop>")
vim.keymap.set({"n", "i", "v"}, "<Down>", "<nop>")

-- Better up & down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Use ; as : to avoid pressing shift every time we need to run a command
vim.keymap.set("n", ";", ":")

-- Unbind Ex-mode (batch processing is not useful for us right now and accidentally pressing this is annoying)
vim.keymap.set("n", "Q", "<nop>")

-- Reload LSP
vim.keymap.set("n", "<leader>L", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:edit<CR>")

-- Tab blocks of text from visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Move lines up and down
vim.keymap.set("n", "<S-K>", ":m-2<CR>")
vim.keymap.set("n", "<S-J>", ":m+<CR>")
