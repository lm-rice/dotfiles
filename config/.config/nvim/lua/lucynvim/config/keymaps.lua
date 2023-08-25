local map = vim.keymap.set

vim.g.mapleader = "<Space>"

-- Unbind some default bindings --
map({"n"          }, "<Space>", "<nop>", { desc = "Unbound <Space>",              noremap = true  }) -- No mapleader collisions with default binds
map({"n", "i", "v"}, "<Left>",  "<nop>", { desc = "Unbound Left Movement Arrow",  noremap = true  })
map({"n", "i", "v"}, "<Right>", "<nop>", { desc = "Unbound Right Movement Arrow", noremap = true  })
map({"n", "i", "v"}, "<Up>",    "<nop>", { desc = "Unbound Up Movement Arrow",    noremap = true  })
map({"n", "i", "v"}, "<Down>",  "<nop>", { desc = "Unbound Down Movement Arrow",  noremap = true  })
map({"n"          }, "Q",       "<nop>", { desc = "Unbound Ex-mode",              noremap = true  })

-- Better down and up --
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- No need to press shift
map("n", ";", ":", { desc = "Rebind command prefix", noremap = true })

-- swap between viewports w/ ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Focus on the window to the left",  noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on the window below",        noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on the window above",        noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on the window to the right", noremap = true })

-- resize using ctrl + arrow keys (broken)
--map("n", "<C-Left>", "<cmd>vertical resize -2<cr>",  { desc = "Decrease window width", noremap = true  })
--map("n", "<leader>j", "<cmd>resize -2<cr>",          { desc = "Decrease window height", noremap = true })
--map("n", "<leader>k", "<cmd>resize +2<cr>",          { desc = "Increase window height", noremap = true })
--map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", noremap = true  })

-- Reload LSP
map("n", "<leader>L", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:edit<CR>")


-- Create restore points in undo.
--[[
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
]]--

-- Tab blocks of text from visual mode
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Move lines up and down
map("n", "<S-K>", ":m-2<CR>", { desc = "Move a line up", remap = false, silent = true})
map("n", "<S-J>", ":m+<CR>", { desc = "Move a line down", remap = false, silent = true})

-- Move code blocks up and down
-- map("x", "<S-K>", ":m '>+1<CR>gv=gv", { desc = "Move a code block up", remap = false, silent = true})
-- map("x", "<S-J>", ":m '<-2<CR>gv=gv", { desc = "Move a code block down", remap = false, silent = true})
