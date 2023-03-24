return {
  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function(_, _)
      require("flutter-tools").setup {
        debugger = {
          enabled = true,
          run_via_dap = false,
        },
        outline = { auto_open = false },
        decorations = {
          statusline = { device = true, app_version = true },
        },
        widget_guides = { enabled = true, debug = true },
        dev_log = { enabled = false, open_cmd = "tabedit" },
        lsp = {
          color = {
            enabled = true,
            background = true,
            virtual_text = false,
          },
          settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
          },
          on_attach = require("plugins.lsp.utils").on_attach,
          capabilities = require("plugins.lsp.utils").capabilities,
        },
      }
    end,
  },
}
