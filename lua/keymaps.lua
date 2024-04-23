--vim.keymap.set('n', '<leader>e', '<Cmd>CocCommand explorer<CR>')

local wk = require("which-key")

wk.register({
  ['kj'] = { '<Esc>', 'Esc', mode = 'i' },

  ["<leader>"] = {
    name = "+file",

    q = { ':q<CR>', '[Q]uit',  },

    w = { ':w<CR>', 'Save' },
    h = { ':nohlsearch<CR>', 'No[H]l Search' },
  },

  ['<C-h>'] = {'<C-w>h', 'GoTo Left Window'},
  ['<C-j>'] = {'<C-w>j', 'GoTo Down Window'},
  ['<C-k>'] = {'<C-w>k', 'GoTo Up Window'},
  ['<C-l>'] = {'<C-w>l', 'GoTo Right Window'},
})

