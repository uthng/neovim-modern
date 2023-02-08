local install_root_dir = vim.fn.stdpath "data" .. "/mason"
local extension_path = install_root_dir .. "/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim", "rust-lang/rust.vim", "simrat39/inlay-hints.nvim" },
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              assist = {
                importEnforceGranularity = true,
                importPrefix = "crate",
              },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local lsp_utils = require "plugins.lsp.utils"
          lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "<leader>cR", "<cmd>RustRunnables<cr>", { buffer = buffer, desc = "Runnables" })
              vim.keymap.set("n", "<leader>cl", function() vim.lsp.codelens.run() end, { buffer = buffer, desc = "Code Lens" })
            end
          end)

          local ih = require "inlay-hints"

          require("rust-tools").setup {
            tools = {
              hover_actions = { border = "solid", auto_focus = true },
              on_initialized = function()
                vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                  pattern = { "*.rs" },
                  callback = function()
                    vim.lsp.codelens.refresh()
                  end,
                })

                ih.set_all()
              end,
              autoSetHints = true,
              runnables = {
                use_telescope = true,
              },
              inlay_hints = {
                -- automatically set inlay hints (type hints)
                -- default: true
                auto = true,

                -- Only show inlay hints for the current line
                only_current_line = false,

                -- whether to show parameter hints with the inlay hints or not
                -- default: true
                show_parameter_hints = true,

                -- prefix for parameter hints
                -- default: "<-"
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                -- default: "=>"
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
              },
            },
            server = opts,
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
          }
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      setup = {
        codelldb = function()
          local dap = require "dap"
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--port", "${port}" },

              -- On windows you may have to uncomment this:
              -- detached = false,
            },
          }
          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }

          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
        end,
      },
    },
  },
}
