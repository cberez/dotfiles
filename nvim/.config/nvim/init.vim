set nocompatible		" be iMproved, required
filetype off			" required

call plug#begin('~/.local/share/nvim/plugged')

" Vim styling
Plug 'tpope/vim-sensible'           " Defaults
Plug 'joshdick/onedark.vim'         " Theme
Plug 'webdevel/tabulous'            " Tabline design
Plug 'ryanoasis/vim-devicons'	    " Add dev icons to NERDTree & airline
Plug 'vim-airline/vim-airline'      " Customize the statusline
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " File system explorer in vim
Plug 'gko/vim-coloresque'	      " Preview colors

" Utilities
Plug 'tpope/vim-commentary'         " (Un)Comment lines
Plug 'tpope/vim-fugitive'	      " Git cli in Vim
Plug 'mhinz/vim-sayonara'           " Properly close buffers
Plug 'junegunn/fzf.vim'             " FuzzyFinder in vim
Plug 'chiedo/vim-case-convert'      " Easy text casing conversion
" Plug 'Shougo/deoplete.nvim'         " Autocompletion
Plug 'tpope/vim-eunuch'             " UNIX shell commands in vim
Plug 'airblade/vim-gitgutter'       " Git gutter in vim
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}  " Completion
Plug 'junegunn/goyo.vim'            " Distraction free mode

" Language support
Plug 'vim-syntastic/syntastic'      " Syntax checking for Vim
Plug 'GEverding/vim-hocon'          " Syntax coloration for HOCON (typesafe .conf files)
Plug 'stephpy/vim-yaml'
" Plug 'derekwyatt/vim-scala'         " Scala support
" Plug 'natebosch/vim-lsc'            " Scala language server
" Plug 'ensime/ensime-vim'            " Lots of love for scala
" Plug 'majutsushi/tagbar'            " Class outline viewer
Plug 'chrisbra/csv.vim'	            " CSV
Plug 'moll/vim-node'                " Node.JS
Plug 'fatih/vim-go'                 " Go
Plug 'hashivim/vim-terraform'       " Terraform

call plug#end()

filetype plugin indent on	      " Load plugins according to detected filetype

" Markdown formatting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'shell=sh']  " Code blocks syntax highlighting

" GitGutter
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1

" Airline
let g:airline_powerline_fonts = 1	" Enable powerline fonts
let g:airline_exclude_preview = 0	" Exclude preview windows of statusline update
let g:airline_skip_empty_sections = 1 	" Do not draw separators of empty sections
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " Skip utf-8[unix] if expected
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_scala_scalastyle_config_file = "scalastyle-config.xml"
" highlight SyntasticErrorSign guifg=white guibg=red

" Deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources={}
" let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
" let g:deoplete#omni#input_patterns={}
" let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" NERDTree
let NERDTreeShowHidden=1        " Show hidden files
"autocmd vimenter * NERDTree	" Open on vim startup

				" Open on vim startup if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

				" Open on vim startup on opening directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

				" Close vim if only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-scala
" let g:scala_scaladoc_indent = 0
" au BufRead,BufNewFile *.sbt set filetype=scala

" vim-lsc
" let g:lsc_server_commands = {
"   \ 'scala': {
"   \    'command': '/usr/local/bin/metals-vim',
"   \    'log_level': 'Log'
"   \  }
"   \}


syntax on			      " Enable syntax highlighting
color onedark			      " Load color theme

" General
set guicursor=a:blinkon0              " Make cursor not blink
"set termguicolors                    " Breaks Urxvt colors
set number                            " Show line numbers
set relativenumber                    " Show line number relative to cursor
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
autocmd BufWritePre * :%s/\s\+$//e    " Auto remove trailing on save
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

" set the runtime path to include Vundleand fzf
set rtp+=/usr/bin/fzf

" Setup the same behavior as on every IDE with automatic tag close
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Mappings
let mapleader = ","
" Clear search highlight

nnoremap cs :noh<CR>
" Exiting buffer / window
nnoremap qq :Sayonara!<CR>
nnoremap qqq :Sayonara<CR>
" Git
nnoremap gb :Gblame<CR>
" Fzf search
nnoremap ff :Files<CR>
nnoremap fb :Buffers<CR>
nnoremap fc :History:<CR>
nnoremap fh :History<CR>
nnoremap fs :History/<CR>
" Splits
nnoremap sh :split<CR>
nnoremap sht :topleft split<CR>
nnoremap shb :botright split<CR>
nnoremap sv :vertical split<CR>
nnoremap svr :botright vertical split<CR>
nnoremap svl :topleft vertical split<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Windows
nnoremap <C-w>h :new<CR>
nnoremap <C-w>ht :topleft new<CR>
nnoremap <C-w>hb :botright new<CR>
nnoremap <C-w>v :vertical new<CR>
nnoremap <C-w>vt :topleft vertical new<CR>
nnoremap <C-w>vb :botright vertical new<CR>
" Tabs
nnoremap tnn :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tl :tablast<CR>
nnoremap tf :tabfirst<CR>
" ctags
nnoremap <leader><space> <C-]>
" NERDTree
nnoremap ntr :NERDTree<CR>
" Vim tagbar
nmap tgb :TagbarToggle<CR>
