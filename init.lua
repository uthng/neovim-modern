require "config.options"
require "config.lazy"
require "config.autocmds"
require "config.keymaps"

-- Do not use event VeryLazy User because it requires to start mynv
-- alone to generate VeryLazy event.
-- In the case of opening directly a file, VeryLazy will be not generated,
-- and config.autocmds is not loaded.
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require "config.autocmds"
--     require "config.keymaps"
--   end,
-- })
