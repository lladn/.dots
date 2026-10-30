return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(buf)
        local gs = require("gitsigns")
        vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = buf, desc = "Git diff this file" })
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = buf, desc = "Preview hunk" })
      end,
    })
  end
}
