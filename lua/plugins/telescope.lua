return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          theme = "dropdown"
        }
      }
    })

    local wk = require("which-key")
    local builtin = require('telescope.builtin')

    wk.register({
      ["<leader>"] = {
        name = "+file",
        s = {
          name = "+Telescope",
          f = { builtin.find_files, 'Find files' },
          g = { builtin.live_grep, 'Find grep' },
          b = { builtin.buffers, 'Find buffers' },
          h = { builtin.help_tags, 'Find help tags' },
        },
      },
    })
  end
}
