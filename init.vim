set nocompatible              " be iMproved, required
set encoding=utf8
set fileencoding=utf-8
scriptencoding utf-8
filetype off                  " required
set guifont=Fura\ Code\ Medium\ Nerd\ Font\ 20
set timeoutlen=1000 ttimeoutlen=0
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set keymap=russian-jcukenwin
set t_Co=256
set ttyfast                                 " terminal acceleration
set autoindent                             " indent when moving to the next line while writing code
set confirm
set enc=utf-8	                            " utf-8 by default
set expandtab                               " expand tabs into spaces
set exrc                                    " enable usage of additional .vimrc files from working directory
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set hidden
set iminsert=0
set imsearch=0
set laststatus=2
set nobackup 	                            " no backup files
set nofoldenable
set noswapfile 	                            " no swap files set nowritebackup                           " only in case you don't want a backup file while editing
set number relativenumber                                 " show line numbers
set ruler
set scrolloff=50                            " let 10 lines before/after cursor during scroll
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
set shell=/bin/zsh
set shiftwidth=4                            " shift lines by 4 spaces
set showmatch                               " shows matching part of bracket pairs (), [], {}
set smarttab                                " set tabs for a shifttabs logic
set spell
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set undofile
set nowrap linebreak nolist
set nohlsearch

" Underline current cursor line
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

highlight LineNr ctermfg=grey
highlight lCursor guifg=NONE guibg=Cyan

augroup CustomCursorLine
    au!
    au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END

call plug#begin('~/.config/nvim/plugged')
" ------------------=== Colorscheme ===----------------------
Plug 'morhetz/gruvbox'
Plug 'abudden/taghighlight-automirror'
"
" ------------------=== Git ===----------------------
Plug 'Xuyuanp/nerdtree-git-plugin'  
Plug 'aklt/plantuml-syntax'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'

" ------------------=== File Navigation ===----------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-visual-star-search'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'easymotion/vim-easymotion'
Plug 'thaerkh/vim-indentguides' 
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/FuzzyFinder'
Plug 'chaoren/vim-wordmotion'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'rhysd/clever-f.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'yegappan/mru'

"------------------=== Other ===---------------------------------
Plug 'andreshazard/vim-logreview'
Plug 'chriskempson/base16-vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'kassio/neoterm'

" --- i3 ---
Plug 'mboughaba/i3config.vim'

""---------------=== Languages support ===-------------
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-scripts/L9'
Plug 'dbgx/lldb.nvim'
Plug 'craigemery/vim-autotag'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


"" --- Rust ---
Plug 'AndrewRadev/splitjoin.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'dense-analysis/ale'

"" --- Sol ---
Plug 'tomlion/vim-solidity'
Plug 'dmdque/solidity.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()

colorscheme gruvbox
filetype on
filetype plugin on
filetype plugin indent on

"
" Main setting
"
syntax enable                               " enable syntax highlighting

"
" Vim-Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:Powerline_symbols='unicode' "Поддержка unicode

"Clever-f
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000
let g:clever_f_smart_case        = 1

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2

" Cmake
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let makeprg='make'

command! -nargs=* CmakeOwn call Ntbuild_cmake(<f-args>)

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nowrap
augroup END

"=====================================================
"" Relative Numbering 
"=====================================================
nnoremap <Leader>r :set relativenumber!<CR>

"=====================================================
"" Search settings
"=====================================================
set incsearch " incremental search

"=====================================================
"" Comfortable Motion Settings
"=====================================================
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 40  " Feel free to increase/decrease this value.

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40

"=====================================================
"" NERDComment Settings 
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"=====================================================
"" DevIcon Settings
"=====================================================
" loading the plugin 
let g:webdevicons_enable = 1

" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0


" Work with buffer
map <C-q> :wqa!<CR>    " CTRL+q закрыть и сохранить

" TagBar настройки
let g:tagbar_autofocus = 0

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pudb_python_launcher = '/usr/bin/python3.7'

let g:loaded_python_provider = 1

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

" документация
let g:pymode_python = 'python3'
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 0

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

let g:jedi#use_tabs_not_buffers = 1

let g:syntastic_python_checkers = ['pyflakes']

" Enable background opacity
hi Normal guibg=NONE ctermbg=NONE 

no <down>  <Nop>
no <left>  <Nop>
no <right> <Nop>
no <up>    <Nop>

ino <down>  <Nop>
ino <left>  <Nop>
ino <right> <Nop>
ino <up>    <Nop>

vno <down>  <Nop>
vno <left>  <Nop>
vno <right> <Nop>
vno <up>    <Nop>

nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j

nnoremap <A-l> <C-i>
nnoremap <A-h> <C-o>

nnoremap gn :bnext<CR>
nnoremap gp :bprev<CR>

nnoremap H ^
nnoremap <F5> :UndotreeToggle<cr>

"==================================================
" C++ mode setting
"==================================================

let g:rainbow_active = 1

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"==================================================
" Rust mode setting
"==================================================

let g:LanguageClient_serverCommands = { 'rust': ['~/.cargo/bin/ra_lsp_server'], }
let g:LanguageClient_autoStart = 1

let g:racer_cmd = "/home/sad/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

"==================================================
" Rust cargo
"==================================================

au FileType rust nmap <silent> gd :call LanguageClient#textDocument_definition()<CR>
au FileType rust nmap <silent> <leader><Insert> :call LanguageClient_contextMenu()<CR>
au FileType rust nmap <silent> gr :call LanguageClient#textDocument_rename()<CR>

au FileType rust nmap <F1>  :RustFmt<CR>
au FileType rust nmap <F13> :AbortDispatch<CR>

au FileType rust nmap <F7>  :Dispatch cargo build<CR>
au FileType rust nmap <F19> :Dispatch cargo build --tests<CR> 
au FileType rust nmap <F31> :Dispatch cargo build --release --tests<CR> 

au FileType rust nmap <F4>  :Dispatch cargo clippy<CR>

au FileType rust nmap <F6>  :Dispatch cargo test<CR>
au FileType rust nmap <F18> :Dispatch cargo bench<CR>

au FileType rust nmap <F9>  :Cargo run<CR>
au FileType rust nmap <F21> :Cargo run --release<CR>

"==================================================
" NERD Tree and Tagbar
"==================================================

map <silent><A-!> :NERDTreeFind<CR>
map <silent><A-1> :NERDTreeToggle<CR>
map <silent><A-2> :Tagbar<CR>
map <silent><A-0> :FocusDispatch<CR>

"==================================================
" Copy system clipboard
"==================================================

nnoremap <M-y> "+y
nnoremap <M-d> "+d
nnoremap <M-p> "+d

"==================================================
" Easymotion
"==================================================

map  <Leader>n <Plug>(easymotion-bd-jk)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>n <Plug>(easymotion-overwin-line)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

nmap <Leader>/ :Rg<Space>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>* :Lines <C-r><C-w><CR>
nnoremap <Leader># :Rg <C-r><C-w><CR>

"==================================================
" Git binding
"==================================================
nmap <Leader>gb     :Gblame<CR>
nmap <Leader>gc     :Gcommit<CR>
nmap <Leader>gC     :Gcommit --amend<CR>

nmap <Leader>gs     :Gdiffsplit master<CR>

nmap <Leader>gp     :Gpush<CR>
nmap <Leader>g<S-P> :Gpull<CR>
nmap <Leader>gw     :Gwrite<CR>
nmap <Leader>g<S-W> :Gcommit --interactive<CR>

nmap <Leader>gm     <Plug>(git-messenger)
let g:git_messenger_include_diff = "all"

command! Vimrc :split $MYVIMRC
command! Tmux  :split | <C-W>j | terminal tmux attach;

nmap <Leader>b :Tmux<CR>
nmap <Leader>a :terminal<CR>

nmap <Leader>v :Vimrc<CR>
nmap <Leader>u :source $MYVIMRC<CR>

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap Q @@
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cp<CR>

command! SaveAndLeft  :mksession! | qa
nnoremap <Leader>q :SaveAndLeft<CR>

let g:cargo_command = "Dispatch cargo {cmd}"

let g:ale_rust_rusfmt_options = ''

function QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
   endfor
   call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()

" Terminal mode binding
tnoremap <F3> <C-\><C-n>

"==================================================
" Fzh mode setting
"==================================================

map gd :YcmCompleter GoTo<CR>

nmap <Leader>' :Marks<CR>
nmap <Leader>; :Buffers<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>c :BCommits<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>t :BTags<CR>
