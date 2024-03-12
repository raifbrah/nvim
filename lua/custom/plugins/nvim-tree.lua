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
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '+',
              arrow_open = '-',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
          },
          show = {
            file = false,
          },
        },
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true })
  end,
}
