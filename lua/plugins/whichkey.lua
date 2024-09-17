return {
  {
    "mrjones2014/legendary.nvim",
    keys = {
      { "<C-S-p>", "<cmd>Legendary<cr>", desc = "Legendary" },
      { "<leader>hc", "<cmd>Legendary<cr>", desc = "Command Palette" },
    },
    opts = {
      which_key = { auto_register = true },
    },
  },
  {
    "folke/which-key.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    event = "VeryLazy",
    config = function()
      local wk = require "which-key"
      wk.setup {
        show_help = true,
        plugins = { spelling = true },
        -- replace = { ["<leader>"] = "SPC" },
        -- triggers = "auto",
      }
      wk.add {
        mode = { "n", "v" },
        { "<leader>w", "<cmd>update!<CR>", desc = "Save" },
        -- stylua: ignore
        { "<leader>Q", group = "Quit"},
        {
          "<leader>Qq",
          function()
            require("utils").quit()
          end,
          desc = "Quit",
        },
        { "<leader>Qt", "<cmd>tabclose<cr>", desc = "Close Tab" },
        -- q = { name = "Quit",
        --   q = { function() require("utils").quit() end, "Quit", },
        --   t = { "<cmd>tabclose<cr>", "Close Tab" },
        -- },
        -- b = { name = "+Buffer" },
        -- d = { name = "+Debug" },
        -- f = { name = "+File" },
        -- h = { name = "+Help" },
        -- g = { name = "+Git" },
        -- p = { name = "+Project" },
        -- -- t = { name = "+Test", N = { name = "Neotest" }, o = { "Overseer" } },
        -- v = { name = "+View" },
        -- z = { name = "+System" },
        -- -- stylua: ignore
        -- s = {
        --   name = "+Search",
        --   c = { function() require("utils.coding").cht() end, "Cheatsheets", },
        --   s = { function() require("utils.coding").stack_overflow() end, "Stack Overflow", },
        --   -- n = { name = "+Noice" },
        -- },
        -- c = {
        --   name = "+Code",
        --   g = { name = "Annotation" },
        --   x = {
        --     name = "Swap Next",
        --     f = "Function",
        --     p = "Parameter",
        --     c = "Class",
        --   },
        --   X = {
        --     name = "Swap Previous",
        --     f = "Function",
        --     p = "Parameter",
        --     c = "Class",
        --   },
        -- },
        -- T = {
        --   name = "+Term",
        --   g = { "<cmd>lua require('utils.term').git_client_toggle()<CR>", "Git TUI" },
        -- }, -- Database
        -- D = {
        --   name = "Database",
        --   u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
        --   f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
        --   r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
        --   q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
        -- },
        { "<leader>g", "<cmd>lua require('utils.term').git_client_toggle()<CR>", desc = "Git TUI" },
        { "<leader>D", group = "Database" },
        { "<leader>Du", "<Cmd>DBUIToggle<Cr>", desc = "Toggle UI" },
        { "<leader>Df", "<Cmd>DBUIFindBuffer<Cr>", desc = "Find buffer" },
        { "<leader>Dr", "<Cmd>DBUIRenameBuffer<Cr>", desc = "Rename buffer" },
        { "<leader>Dq", "<Cmd>DBUILastQueryInfo<Cr>", desc = "Last query info" },
      }
    end,
  },
}
