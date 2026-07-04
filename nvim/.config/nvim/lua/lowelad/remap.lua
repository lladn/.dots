local which_key = require "which-key"
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    which_key.add({
      { "gd", vim.lsp.buf.definition, desc = "Go to definition", buffer = event.buf },
      { "gl", vim.diagnostic.open_float, desc = "Open diagnostic float", buffer = event.buf },
      { "K", vim.lsp.buf.hover, desc = "Show hover information", buffer = event.buf },
      { "<leader>l", group = "LSP", buffer = event.buf },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code action", buffer = event.buf },
      { "<leader>lr", vim.lsp.buf.references, desc = "References", buffer = event.buf },
      { "<leader>ln", vim.lsp.buf.rename, desc = "Rename", buffer = event.buf },
      { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol", buffer = event.buf },
      { "<leader>ld", vim.diagnostic.open_float, desc = "Open diagnostic float", buffer = event.buf },
      { "[d", vim.diagnostic.goto_next, desc = "Go to next diagnostic", buffer = event.buf },
      { "]d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic", buffer = event.buf },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = event.data.client_id }
      end
    })
  end,
})

which_key.add({
  { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  { "<leader>p", "\"_dP", desc = "Paste without overwrite" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle comment" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
  { "<leader>t", ":Today<CR>", desc = "Open today's note" },
  { "J", "mzJ`z", desc = "Join lines and keep cursor position" },
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "n", "nzzzv", desc = "Next search result and center" },
  { "N", "Nzzzv", desc = "Previous search result and center" },
})

which_key.add({
  { "<leader>f", group = "Find" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.git_files, desc = "Find git files" },
  { "<leader>fl", builtin.live_grep, desc = "Live grep" },
  { ";", builtin.buffers, desc = "Find buffers" },
})

which_key.add({
  { "J", ":m '>+1<CR>gv=gv", desc = "Move selection down", mode = "v" },
  { "K", ":m '<-2<CR>gv=gv", desc = "Move selection up", mode = "v" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle comment", mode = "v" },
})

vim.keymap.set('i', '<Right>', '<Right>', { noremap = true })
