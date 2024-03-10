set encoding=utf-8
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

" Поиск без учета регистра или с учетом регистра если присутствует заглавная буква
set ignorecase
set smartcase

" отменяет автокомментирование новых строк
autocmd FileType * set formatoptions-=ro

let mapleader = " " "Reassigning the <leader> key
inoremap kj <esc>

" Windows navigation
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>


" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " open file in new nab
let g:netrw_keepdir = 0 " Синхронизация текущего каталога и каталога просмотра. Это поможет избежать ошибки перемещения файлов.
let g:netrw_winsize = 30 " Размер окна при создании разделения

" Netrw disabled
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1



" Подключение плагинов через плагин 'VimPlug'
call plug#begin('~/.vim/plugged')

Plug 'windwp/nvim-autopairs' " Автозакрытие: [, {, ( и т.д. 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A file explorer tree for neovim written in lua
Plug 'nvim-tree/nvim-tree.lua'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Закоментировать строку при нажатии gcc или выделенный фрагмент при нажатии gc  
Plug 'tpope/vim-commentary'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Toggleterm
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Lazygit
Plug 'kdheepak/lazygit.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Smooth scrolling Neovim plugin written in lua
Plug 'karb94/neoscroll.nvim'

" Autocorrect of the closing HTML tag, when changing the openin tag
Plug 'windwp/nvim-ts-autotag'

" colorschemes:
Plug 'bluz71/vim-moonfly-colors'

call plug#end()


"Coc extensions autoinstall
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html-css-support',
  \ 'coc-svg',
  \ 'coc-docker',
  \ 'coc-yaml',
  \ 'coc-git',
  \ '@yaegassy/coc-volar']


" Treesitter extensions autoinstall
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "angular",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "json",
    "html",
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



" nvim-tree setup
lua require("nvim-tree").setup()
" nvim-tree key shortcut to open
nmap <silent> <leader>n :NvimTreeToggle<CR>

" Telescope keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" COC NVIM SETTINGS:START
" Триггер автокомплита coc.nvim
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Навигация по автокоплиту coc.nvim
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" COC NVIM SETTINGS:END


"Toggleterm setup
lua << EOF
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
}
EOF

" Lualine setup
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF


" Lazygit setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR> 


" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF

" Autopairs setup
lua << EOF
require("nvim-autopairs").setup {}
EOF

" nvim-ts-autotag setup
lua require('nvim-ts-autotag').setup()

" Neoscroll plugin Quickstart
lua require('neoscroll').setup()


" Colorschemes
syntax on
colorscheme moonfly

" Включает поддержку широкого цветового охвата
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Makes the background fill transparent
" highlight Normal guibg=NONE


" Neovide setups
if exists("g:neovide")
  let g:neovide_scale_factor = 0.8
  let g:neovide_hide_mouse_when_typing = v:true
endif
