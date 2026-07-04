return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    replace = {
      key = {},
    },
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    win = {
      border = "single",
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    defer = function(ctx)
      return ctx.operator == "gc" or ctx.operator == "gb"
    end,
    show_help = true,
    show_keys = true,
    triggers = {
      { "<auto>", mode = "nxso" },
    },
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }
}
