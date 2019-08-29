set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax enable
set backspace=indent,eol,start
set autoindent
set ignorecase
set fileencoding=utf-8
set hlsearch
set smartcase 
set incsearch
set winwidth=84
set winheight=5
set winheight=5
set winheight=999
set bg=dark
set tabstop=2	 
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set autoread      " reload files when changed.
set clipboard+=unnamed          " Yank and paste with system clipboard.
set wildmenu                    " Wildcard searches.


filetype plugin indent on
set complete+=kspell " Autocomplete with dictionary words when spell check is on



" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"fuzzy find (FZF)
set rtp+=~/.fzf


set number relativenumber 
  augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-run-interactive'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'raimondi/delimitmate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'valloric/youcompleteme'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'turbio/bracey.vim'
Plugin 'valloric/matchtagalways'
Plugin 'KabbAmine/zeavim.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"change emmet leader key to (,,)
let g:user_emmet_leader_key=','


" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	    
	     " Set syntax highlighting for specific file types
	   autocmd BufRead,BufNewFile *.md set filetype=markdown
  	   autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
 	   autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  	   autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  	   autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  	   autocmd BufRead,BufNewFile vimrc.local set filetype=vim
  	
        augroup END
