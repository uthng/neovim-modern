-- local indent = 2

vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.o.formatoptions = "jcroqlnt"
--vim.o.shortmess = "filnxtToOFWIcC"
vim.o.shortmess = "filnxtToOFWIc"
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.clipboard = "unnamedplus" -- Access system clipboard
vim.opt.completeopt = "menuone,noselect,noinsert"
vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.joinspaces = false
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars = "tab:|·,eol:¬,trail:·,space:·,extends:»,precedes:«"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.scrollback = 100000
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
--vim.opt.splitkeep = "screen" -- Neovim 0.9
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wildmode = "longest:full,full"
vim.opt.foldmethod = "manual"

vim.opt.switchbuf = "usetab,newtab"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.autowriteall = true

vim.opt.autoread = true

vim.opt.wrap = true

vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
