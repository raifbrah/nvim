--vim.keymap.set('n', '<leader>e', '<Cmd>CocCommand explorer<CR>')

local wk = require("which-key")

wk.register({
  ['kj'] = { '<Esc>', 'Esc', mode = 'i' },

  ["<leader>"] = {
    name = "+file",

    q = {
      name = '+Quit',
      q = { ':q<CR>', '[Q]uit',  },
      w = { ':wq<CR>', 'Quit [W]ith Save',  },
      a = { ':qa<CR>', 'Quit [A]ll',  },
    },

    w = { ':w<CR>', 'Save' },
    h = { ':nohlsearch<CR>', 'No[H]l Search' },
  },
})

