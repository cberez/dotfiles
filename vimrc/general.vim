syntax on			      " Enable syntax highlighting
color onedark			      " Load color theme

" General
set guicursor=a:blinkon0              " Make cursor not blink
set termguicolors
set number                            " Show line numbers
set showmode                          " Show current mode in command-line.
set showcmd                           " Show already typed keys when more are expected.
set mouse =a                          " Enable mouse support
set colorcolumn =120                  " Max line marker
set updatetime =100                   " Set refresh time to 100ms for gitgutter
set autoread                          " Autorefresh file when it has been edited somewhere else
set ruler                             " Show cursor position
set list			      " Display unprintable chars
set listchars=space:.,trail:~,precedes:<,tab:\ \ 	" Replace space with dot, trail with tilde, precedes with inferior
set ttyfast                           " Faster redrawing, for gitgutter
set lazyredraw                        " Only redraw when necessary.
set cursorline                        " Find the current line quickly.
set scrolloff =5
autocmd BufWritePre * :%s/\s\+$//e " Auto remove trailing on save
set splitbelow
set splitright

" Indentation
set autoindent			      " Indent according to previous line.
set expandtab			      " Use spaces instead of tabs.
set softtabstop =2		      " Tab key indents by 2 spaces.
set shiftwidth  =2		      " >> indents by 4 spaces.
set shiftround			      " >> indents to next multiple of 'shiftwidth'.

" Encoding
set encoding=UTF-8
set fileencoding=UTF-8

""" Font
set guifont=Hack\ Regular\ Nerd\ Font\ Complete

