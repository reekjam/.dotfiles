set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'henrik/git-grep-vim'
Plugin 'sjl/vitality.vim'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mhinz/vim-signify'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'dsawardekar/ember.vim'
Plugin 'heartsentwined/vim-emblem'
Plugin 'sukima/xmledit'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" UltiSnips "
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<option>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" end UltiSnips "

call vundle#end()
filetype plugin indent on

colorscheme one

hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set t_Co=256
syntax enable
let mapleader = ","
set guioptions-=T                         " Remove top toolbar
set showtabline=1                         " Show tab bar
set number                                " Show line number
" set guifont=Monaco:h12                    " Set the font and size
set vb                                    " Disable the bell
set showcmd                               " Display the leader key and command
set ruler                                 " Show the cursor position all the time
set hlsearch                              " Hilight matched word
set autoindent
set tabstop=2                             " Set tab space
set shiftwidth=2
set textwidth=80                          " limit text column width
set expandtab
set laststatus=2
" set cursorline                           " Highlight current line
set backspace=start,eol,indent           " Backspace key
set list listchars=tab:>-,trail:·,precedes:«,extends:» " Hidden character indications.
map <F10> <C-w>w                          " Move next window
set clipboard=unnamed                     " For tmux copy and pastew
set background=light
set complete=.,b,u,]                      " Autocomplete source, current file, buffer, and tag
set wildmode=longest,list:longest         " how replacing autocomplete
nnoremap <Leader>rtw :%s/\s\+$//e<CR>     " remove trailing space
autocmd BufRead,BufNewFile *.md setlocal spell " Set spell check on for specific file type
set complete+=kspell                      " Turn on autocomplete for spell check
autocmd BufNewFile, BufRead *.md set filetype=markdown " force all .md file as markdown
hi clear SpellBad                         " Clear highlight misspell
hi clear SpellCap                         " Clear hightlight miscap
hi SpellBad cterm=underline,bold ctermfg=magenta       " Underline misspell word
hi SpellCap cterm=underline,bold ctermfg=blue          " Underline miscap word
autocmd BufRead,BufNewFile *.es6 setfiletype javascript " associate .es6 file type with javascript

" vim-markdown
let g:vim_markdown_folding_disabled=1
" End of vim-markdown
"
" NERDTree
let g:NERDTreeWinPos = "left"             " NERDTree location
map <F12> :NERDTreeToggle<CR>             " Map NERTree with F12
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" End of NERDTree

" ctrlp
let g:ctrlp_map = '<c-p>'                 " Mapping for ctrlp
let g:ctrlp_cmd = 'CtrlP'                 " Command for ctrlp
let g:ctrlp_working_path_mode = 'ra'      " Fuzzy search directory
set wildignore+=*/tmp/*,*.so,*.swp,*zip   " Ignore fuzzy search
" End of ctrlp

" indent guide
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0 " vim indent guides setting
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black " indent color odd black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey " indent color even darkgrey
" End of indent guide

" Buffergator
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_split_size = 20
map <F11> :BuffergatorToggle<CR>
" End of Buffergator

" vimux
let g:VimuxUseNearestPane = 1           " Use the nearest pane
" End of vimux

" turbux
let g:turbux_runner = 'vimux'
let g:turbux_command_prefix = 'foreman run bundle exec'
let g:turbux_command_rspec = 'rspec'
let g:turbux_command_test_unit = 'ruby'
let g:turbux_command_cucumber = 'cucumber'
let g:turbux_command_turnip = 'rspec -rturnip'
let g:no_turbux_mappings = 1
map <leader>t <Plug>SendTestToTmux
map <leader>s <Plug>SendFocusedTestToTmux
" End of turbux

" Backup directories
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='light'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
" End

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
" End

" Signif
" let g:signify_vcs_list = ['git', 'hg']
" End

" tmux_navigator
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" End of tmux_navigator

" XML Syntax folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" End of XML Syntax folding

" Ag
let g:ag_lhandler="topleft lopen"
nnoremap <leader>a :Ag
let g:ag_working_path_mode="r"
" End of Ag

" indentLine
let g:indentLine_enabled = 0  "Disabled by default
map <leader>ig :IndentLinesToggle<CR>
let g:indentLine_char = ':'
" End of indentLine

" TmuxLine
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = {
  \'a': '#h',
  \'win': '#I:#W',
  \'cwin': '#I:#W',
  \'z': ['%I:%M %p', '%A', '%B %d']}
" End of TmuxLine
