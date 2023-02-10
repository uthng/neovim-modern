-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto toggle hlsearch
local ns = vim.api.nvim_create_namespace "toggle_hlsearch"
local function toggle_hlsearch(char)
  if vim.fn.mode() == "n" then
    local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end
vim.on_key(toggle_hlsearch, ns)

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "OverseerForm",
    "OverseerList",
    "checkhealth",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Setup ident, spaces etc. following filetypes
local grpStyleIndent = vim.api.nvim_create_augroup("StyleIndent", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yml", "*.yaml" },
  command = "set filetype=ansible.yaml expandtab tabstop=2 shiftwidth=2 softtabstop=2",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.vue" },
  command = "set filetype=html.css expandtab tabstop=2 shiftwidth=2 softtabstop=2",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.tf", "*.js" },
  command = "set expandtab tabstop=2 shiftwidth=2 softtabstop=2",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.rs" },
  command = "set expandtab tabstop=4 shiftwidth=4 softtabstop=4",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.go" },
  command = "set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.rs" },
  command = "set expandtab tabstop=4 shiftwidth=4 softtabstop=4",
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.rs", "*.go", "*.php", "*.vue", "*.js", "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 200)
  end,
  group = grpStyleIndent,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = { "*" },
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = grpStyleIndent,
})
