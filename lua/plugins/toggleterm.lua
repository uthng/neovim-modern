return {
  "akinsho/toggleterm.nvim",
  keys = { [[<C-t>]] },
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = 80,
    hide_numbers = true,
    open_mapping = [[<C-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 0.3,
    start_in_insert = true,
    persist_size = true,
    direction = "vertical",
    winbar = {
      enabled = false,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
}
