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

    local builtin = require('telescope.builtin')
    local wk = require("which-key")

    wk.register({
      ["<leader>"] = {
        name = "+file",
        s = {
          name = "+Telescope",
          f = { builtin.find_files, 'Find [F]iles' },
          g = { builtin.live_grep, 'Find [G]rep' },
          b = { builtin.buffers, 'Find [B]uffers' },
          h = { builtin.help_tags, 'Find [H]elp tags' },
        },
      },
    })
  end
}
