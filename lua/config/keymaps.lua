local keymap = vim.keymap.set

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP')

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize window using <shift> arrow keys
--keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
--keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
--keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
--keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- move the current line below
keymap("n", "<leader>-", "ddp")

-- move the current line above
keymap("n", "<leader>_", "ddkP")

-- switch tab
keymap("n", "<S-right>", ":tabn<CR>")
keymap("n", "<S-left>", ":tabp<CR>")
keymap("n", "<S-z>", ":tabs<CR>")
keymap("n", "<S-t>", ":tabe")

-- Handle  buffer switch
keymap("n", "<S-up>", ":bp<CR>")
keymap("n", "<S-down>", ":bn<CR>")
keymap("n", "<S-b>", ":ls<CR>")
keymap("n", "<S-e>", ":e")

-- Quickfix
keymap("n", "<leader>co", ":copen<CR>:set modifiable<CR>")
keymap("n", "<leader>cn", ":cn<CR>")
keymap("n", "<leader>cp", ":cp<CR>")
keymap("n", "<leader>cq", ":cclose<CR>")

-- Handle windows
-- Maximize & minimize current windows
keymap("n", "<Space><up>", "<C-W>|<C-W>_")
keymap("n", "<Space><down>", "<C-W>=")
keymap("n", "<C-W>M", "<C-W>|<C-W>_")
keymap("n", "<C-W>m", "<C-W>=")

-- set moving between windows to ctrl+arrows
keymap("n", "<C-S-Right>", "<c-w>l", { silent = true })
keymap("n", "<C-S-Left>", "<c-w>h", { silent = true })
keymap("n", "<C-S-Up>", "<c-w>k", { silent = true })
keymap("n", "<C-S-Down>", "<c-w>j", { silent = true })
keymap("n", "<C-S-u>", "<c-w>s", { silent = true })
keymap("n", "<C-S-v>", "<c-w>v", { silent = true })
keymap("n", "<C-S-c>", "<c-w>c", { silent = true })

-- set moving between windows to ctrl+hjkl
keymap("n", "<C-l>", "<c-w>l", { silent = true })
keymap("n", "<C-h>", "<c-w>h", { silent = true })
keymap("n", "<C-k>", "<c-w>k", { silent = true })
keymap("n", "<C-j>", "<c-w>j", { silent = true })

-- remove last search highlight
keymap("n", "<Space>l", ":nohlsearch<CR><C-l>")

keymap("n", "<C-a>", "ggVG")
keymap("n", "<S-w>", ":w!<CR>")
keymap("n", "<S-w-q>", ":wq!<CR>")
keymap("n", "<S-c>", ":close")
keymap("n", "<S-q>", ":q!<CR>")
keymap("n", "<tab>", ">><ESC>")
keymap("n", "<S-tab>", "<<<ESC>")
