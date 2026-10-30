return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- or, branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        preview = {
          treesitter = false,
        },
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading', '--with-filename',
          '--line-number', '--column', '--smart-case', '--hidden',
        },
        file_ignore_patterns = { '%.git/' },
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
            ['<C-h>'] = function() vim.api.nvim_input('<Left>') end,
            ['<C-l>'] = function() vim.api.nvim_input('<Right>') end,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
        },
      },
    })
    -- local builtin = require('telescope.builtin')
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    -- vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
    -- vim.keymap.set('n', ';', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
