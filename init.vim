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
"call vam#ActivateAddons(vim-snippets, {snipmate})
" use <c-x><c-p> to complete plugin names

" OPTION 3: Create a file ~/.vim-scripts putting a PLUGIN_NAME into each line (# for comments)
" See lazy loading plugins section in README.md for details
"call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})

set nocompatible
set autochdir
set encoding=utf-8
set clipboard=unnamedplus
filetype off
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
Plug 'mlaursen/vim-react-snippets'
Plug 'luochen1990/rainbow'
call plug#end()
call vundle#begin()
Plugin 'dracula/vim', { 'name': 'dracula' }
"Plugin 'vim-python/python-syntax'
Plugin 'kh3phr3n/python-syntax'
Plugin 'sainnhe/edge'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'xuhdev/SingleCompile'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-manager'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'ajh17/VimCompletesMe.git'
Plugin 'junegunn/vim-easy-align'
Plugin 'https://github.com/junegunn/vim-github-dashboard.git'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'tpope/vim-fireplace', { 'for': 'clojure' }
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plugin 'fatih/vim-go', { 'tag': '*' }
Plugin 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'rafi/awesome-vim-colorschemes'
"Plugin 'ajulraju/vim-colorscheme.visual'
Plugin 'preservim/nerdcommenter'
call vundle#end()
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

"ActivateAddons vim-snippets snipmate
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:user_emmet_leader_key=','
let g:ctrlp_use_caching = 0
let g:rainbow_active = 1
let g:airline_theme='challenger_deep'
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDer<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
"nnoremap <Leader>pr :RainbowToggle<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <Leader>gt :YcmCompleter GoTo<Enter>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <Leader>vs :vsplit<CR>
nmap <Leader>; A;<Esc>
nmap <Leader>T :below terminal <CR>
nmap <Leader>t :tabnew <CR>
nmap , <C-Y>
nmap <Up> 5<C-W>-
nmap <Down> 5<C-W>+
nmap <Left> 10<C-W><
nmap <Right> 10<C-W>>
nmap <Leader>co :SCCompile<cr>
nmap <Leader>cr :SCCompileRun<cr>
nmap <Leader>nl :!clear<cr>
imap jj <Esc>
imap JJ <Esc><Tab>
imap zz <Esc>A
imap ZZ <Esc>A
imap qq <Esc>wa
imap QQ <Esc>wa
"imap <Tab> <Plug>snipMateNextOrTrigger
vmap , <C-Y>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>pl :PluginInstall<Enter>
nnoremap <silent> <leader>pc :PluginClean<Enter>
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>r :source $MYVIMRC<CR>
vnoremap <C-c> "*y 
syntax on
set number
set tabstop=4 softtabstop=4
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
"colorscheme base16-xcode-dusk

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set background=dark

highlight YcmErrorLine guibg=Blue
highlight YcmErrorSign guibg=Blue

" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@mossbayeng.com>
" Last Change:	2001 July 13

hi clear
if exists("syntax_on")
  syntax reset
endif
" The configuration options should be placed before `colorscheme edge`.
"   " Important!!
" The configuration options should be placed before `colorscheme edge`.
let g:airline_theme = 'minimalist'
let g:edge_transparent_background = 1
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme minimalist
hi Visual term=reverse ctermfg=91 ctermbg=Magenta gui=NONE guifg=Black guibg=Yellow

" Fix colors of YCM
highlight YcmWarningSign ctermfg=202 guifg=#ff5f00
highlight YcmWarningSection ctermfg=202 guifg=#ff5f00 gui=underline cterm=underline
highlight YcmErrorSection ctermfg=88 guifg=#d7005f gui=underline cterm=underline
highlight YcmErrorSign ctermfg=88 guifg=#d7005f
highlight clear SignColumn
highlight clear TabLineFill
highlight clear VertSplit
highlight LineNr ctermfg=grey ctermbg=NONE
highlight TabLine ctermbg=None
hi Normal ctermbg=NONE
hi NoNText ctermbg =NONE
hi Structure gui=italic cterm=italic
hi Type gui=italic cterm=italic
hi StorageClass gui=italic cterm=italic
hi Identifier gui=italic cterm=italic
hi Constant gui=italic cterm=italic
highlight TabLineSel ctermfg=Magenta
highlight Pmenu ctermbg=236 ctermfg=Magenta gui=bold
" dark red
hi tsxTagName guifg=#E06C75 ctermfg=DarkRed
hi tsxComponentName guifg=#E06C75 ctermfg=DarkRed
hi tsxCloseComponentName guifg=#E06C75 ctermfg=DarkRed

" orange
hi tsxCloseString guifg=#F99575 ctermfg=214
hi tsxCloseTag guifg=#F99575 ctermfg=214
hi tsxCloseTagName guifg=#F99575 ctermfg=214
hi tsxAttributeBraces guifg=#F99575 ctermfg=214
hi tsxEqual guifg=#F99575 ctermfg=214

" yellow
hi tsxAttrib guifg=#F8BD7F ctermfg=226 cterm=italic
hi tsxTagName guifg=#E06C75 ctermfg=226
hi tsxComponentName guifg=#E06C75 ctermfg=226
hi tsxCloseComponentName guifg=#E06C75 ctermfg=226

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
let g:rainbow_conf = {
            \	'ctermfgs': ['95', '97', '1', '61'],
            \}
"let g:python_highlight_indent_errors = 0
"let g:python_highlight_space_errors = 0
"let g:python_highlight_all = 1
let python_self_cls_highlight = 1
let python_no_parameter_highlight = 1
hi pythonSelf ctermfg=168 cterm=italic
hi pythonClass ctermfg=217 
hi pythonSpaceError ctermbg=NONE
set mouse=a
