return {
  -- add json to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork" })
  --   end,
  -- },

  -- -- correctly setup lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     -- make sure mason installs the server
  --     servers = {
  --       gopls = {
  --         settings = {
  --           gopls = {
  --             hints = {
  --               assignVariableTypes = true,
  --               compositeLiteralFields = true,
  --               compositeLiteralTypes = true,
  --               constantValues = true,
  --               functionTypeParameters = true,
  --               parameterNames = true,
  --               rangeVariableTypes = true,
  --             },
  --             analyses = {
  --               nilness = true,
  --               unusedparams = true,
  --               unusedwrite = true,
  --               useany = true,
  --             },
  --             experimentalPostfixCompletions = true,
  --             gofumpt = true,
  --             staticcheck = true,
  --             usePlaceholders = true,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
