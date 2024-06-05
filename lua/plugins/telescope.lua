return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          height = 0.99,
          width = 0.99,
          preview_cutoff = 0,
          preview_height = 0.35,
        },
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
