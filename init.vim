set number
set relativenumber
set mouse=a
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set noswapfile

set nowrap
set linebreak
set nolist

" отменяет автокомментирование строки по нажатию на Enter  
autocmd FileType * set formatoptions-=ro


" Сохранение при нажатии комбанации в режиме редактирования
inoremap lk <esc>
inoremap kl <esc>:w<CR> 


" Переопределение клавиш навигации
noremap j h
noremap k j
noremap l k
noremap ; l


" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " open file in new nab


" Подключение плагинов через плагин 'VimPlug'
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs' " Автозакрытие: [, {, ( и т.д. 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Поддержка Vue синтаксиса 
Plug 'leafOfTree/vim-vue-plugin'

" Закоментировать строку при нажатии gcc или выделенный фрагмент при нажатии gc  
Plug 'tpope/vim-commentary'

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
  \ '@yaegassy/coc-volar']


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


" let g:auto_save = 1  " enable AutoSave on Vim 

" Триггер автокомплита 
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Навигация по автокоплиту 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


" Neovide setups
if exists("g:neovide")
  let g:neovide_scale_factor = 0.7
  let g:neovide_hide_mouse_when_typing = v:true
endif
