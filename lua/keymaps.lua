--vim.keymap.set('n', '<leader>e', '<Cmd>CocCommand explorer<CR>')

local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    name = "+file",
    e = { '<cmd>CocCommand explorer<CR>', 'File Explorer' }
  }
})
