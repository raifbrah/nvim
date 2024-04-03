return {
  'uga-rosa/translate.nvim',
  config = function()
    --vim.keymap.set('n', '<leader>tw', 'viw:Translate RU<CR>')
    --vim.keymap.set('x', '<leader>tw', ':Translate RU<CR>')

    local wk = require("which-key")

    wk.register({
      ['<leader>'] = {
        t = {':Translate RU<CR>', '[T]ranslate Text'}
      }
    }, {mode = 'x'})
  end
}
