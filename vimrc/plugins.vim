" set the runtime path to include Vundleand fzf
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim
set rtp+=/usr/bin/fzf

call plug#begin('~/.vim/plugged')

" Vim styling
Plug 'joshdick/onedark.vim'         " Theme
Plug 'webdevel/tabulous'            " Tabline design
Plug 'ryanoasis/vim-devicons'	      " Add dev icons to NERDTree & airline
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " Completion

" Language support
Plug 'vim-syntastic/syntastic'      " Syntax checking for Vim
Plug 'GEverding/vim-hocon'          " Syntax coloration for HOCON (typesafe .conf files)
Plug 'derekwyatt/vim-scala'         " Scala support
Plug 'ensime/ensime-vim'            " Lots of love for scala
" Plug 'majutsushi/tagbar'            " Class outline viewer
Plug 'chrisbra/csv.vim'	      " let Vundle manage Vundle, required
Plug 'moll/vim-node'                " Node.JS

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_scala_scalastyle_config_file = "scalastyle-config.xml"
highlight SyntasticErrorSign guifg=white guibg=red

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" NERDTree
let NERDTreeShowHidden=1        " Show hidden files
autocmd vimenter * NERDTree	" Open on vim startup

				" Open on vim startup if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

				" Open on vim startup on opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

				" Close vim if only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-scala
let g:scala_scaladoc_indent = 0
