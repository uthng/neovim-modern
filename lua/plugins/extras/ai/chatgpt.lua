return {
  "jackMort/ChatGPT.nvim",
  cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTEditWithInstructions" },
  -- config = true,
  enabled = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    openai_params = {
      model = "gpt-3.5-turbo",
      frequency_penalty = 0,
      presence_penalty = 0,
      max_tokens = 4096,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    openai_edit_params = {
      model = "gpt-3.5-turbo",
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    actions_paths = {
      "~/.dotfiles/nvim_chatgpt_actions.json",
    },
  },
}
