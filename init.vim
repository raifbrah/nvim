set number
set relativenumber
set mouse=a
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set scrolloff=8
set noswapfile
set nobackup
set nowritebackup

set nowrap
set linebreak
set nolist

" отменяет автокомментирование новых строк
autocmd FileType * set formatoptions-=ro

let mapleader = " " "Reassigning the <leader> key
inoremap kj <esc>


" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " open file in new nab
let g:netrw_keepdir = 0 " Синхронизация текущего каталога и каталога просмотра. Это поможет избежать ошибки перемещения файлов.
let g:netrw_winsize = 30 " Размер окна при создании разделения


" Подключение плагинов через плагин 'VimPlug'
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs' " Автозакрытие: [, {, ( и т.д. 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Закоментировать строку при нажатии gcc или выделенный фрагмент при нажатии gc  
Plug 'tpope/vim-commentary'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Smooth scrolling Neovim plugin written in lua
Plug 'karb94/neoscroll.nvim'

" Autocorrect of the closing HTML tag, when changing the openin tag
Plug 'windwp/nvim-ts-autotag'

" color schemes:
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme'
Plug 'bluz71/vim-moonfly-colors'

call plug#end()


"Coc extensions autoinstall
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html-css-support',
  \ 'coc-svg',
  \ 'coc-prettier',
  \ 'coc-docker',
  \ 'coc-yaml',
  \ '@yaegassy/coc-volar']


" Treesitter extensions autoinstall
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "json",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "yaml",
    "dockerfile"
  },
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

EOF


" Telescope keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF


" nvim-ts-autotag setup
lua require('nvim-ts-autotag').setup()

" Neoscroll plugin Quickstart
lua require('neoscroll').setup()

" Включает поддержку широкого цветового охвата 
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" colorscheme spaceduck
" colorscheme github_dark
" colorscheme github_dark_colorblind
" colorscheme github_dark_default
" colorscheme github_dimmed
" colorscheme github_light
" colorscheme github_light_colorblind
" colorscheme github_light_default
colorscheme moonfly

" Makes the background fill transparent
highlight Normal guibg=NONE


" Триггер автокомплита 
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Навигация по автокоплиту 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


" Neovide setups
if exists("g:neovide")
  let g:neovide_scale_factor = 0.8
  let g:neovide_hide_mouse_when_typing = v:true
endif
