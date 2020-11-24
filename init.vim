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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'mlaursen/vim-react-snippets'
Plug 'luochen1990/rainbow'
call plug#end()
call vundle#begin()
Plugin 'dracula/vim', { 'name': 'dracula' }
"Plugin 'vim-python/python-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'szw/vim-maximizer'
Plugin 'kh3phr3n/python-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'xuhdev/SingleCompile'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-manager'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
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
let g:user_emmet_leader_key='\'
let g:ctrlp_use_caching = 1
let g:rainbow_active = 1
let g:airline_theme='challenger_deep'
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDer<Enter>
nnoremap <Leader>n :NERDTreeToggle<Enter>
"nnoremap <Leader>pr :RainbowToggle<Enter>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <Leader>vs :vsplit<CR>
nmap <Leader>m :MaximizerToggle<CR>
nmap <Leader>; A;<Esc>
nmap <Leader>T :below terminal <CR>
nmap <Leader>t :tabnew <CR>
nmap <Leader>~ viw~e
imap <C-u> <Esc>viw~ea
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db
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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"imap <Tab> <Plug>snipMateNextOrTrigger
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
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set background=dark

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
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
hi CocErrorSign ctermfg=160
hi CocErrorHighlight ctermfg=160 cterm=underline
hi CocWarningHighlight ctermfg=Brown cterm=underline
hi CocInfoSign ctermfg=Brown
hi CocInfoHighlight ctermfg=Brown cterm=underline
