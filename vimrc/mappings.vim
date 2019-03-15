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
