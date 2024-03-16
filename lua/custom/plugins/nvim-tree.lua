return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Setup:
    require('nvim-tree').setup {
      renderer = {
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = '└',
            edge = '│',
            item = '│',
            bottom = '─',
            none = ' ',
          },
        },
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true })
  end,
}
