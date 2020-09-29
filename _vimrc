set nocompatible
set autochdir
set encoding=utf-8
set clipboard=unnamed
filetype off
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
call plug#end()
call vundle#begin()
Plugin 'MarcWeber/vim-addon-manager'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'ajh17/VimCompletesMe.git'
Plugin 'junegunn/vim-easy-align'
Plugin 'https://github.com/junegunn/vim-github-dashboard.git'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'tpope/vim-fireplace', { 'for': 'clojure' }
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plugin 'fatih/vim-go', { 'tag': '*' }
Plugin 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'kien/ctrlp.vim' 
Plugin 'chriskempson/base16-vim'
call vundle#end()
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()
" ACTIVATING PLUGINS

" OPTION 1, use VAMActivate
"VAMActivate PLUGIN_NAME PLUGIN_NAME ..
" OPTION 2: use call vam#ActivateAddons
call vam#ActivateAddons(vim-snippets, {snipmate})
" use <c-x><c-p> to complete plugin names

" OPTION 3: Create a file ~/.vim-scripts putting a PLUGIN_NAME into each line (# for comments)
" See lazy loading plugins section in README.md for details
call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})
ActivateAddons vim-snippets snipmate
nnoremap <SPACE> <Nop>
let mapleader = " "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDer<Enter> 
nnoremap <Leader>pt :NERDTreeToggle<Enter> 
nnoremap <Leader>pt :NERDTreeToggle<Enter> 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
imap jj <Esc>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>r :source $MYVIMRC<CR>
syntax on
set number
set tabstop=4 softtabstop=4
set pythonthreehome=C:\Python36-32\
set pythonthreedll=python37.dll
set shiftwidth=4 
set relativenumber
set noerrorbells
set expandtab
set smartindent
set nowrap
set autoindent
set smartcase
set incsearch
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
colorscheme base16-gruvbox-dark-soft
imap <Tab> <Plug>snipMateNextOrTrigger
