syntax on

set notermguicolors
set smarttab
set cindent
set expandtab
set shiftwidth=2
set number
set relativenumber
set tabstop=2 softtabstop=2
set encoding=utf-8
set nohlsearch
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set colorcolumn=86


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter' " Add comment config
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Themes
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" Status bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Available color schemes: sonokai gruvbox-material onedark gruvbox
colorscheme sonokai



vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let g:airline_solarized_bg='dark'
let g:airline_theme='sonokai'


" coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-docker',
  \ 'coc-vetur',
  \ 'coc-emmet',
  \ ]



" Mappings
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
"inoremap < <><left>
inoremap {<CR> {<CR>}<Esc><S-o>
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
" Shows documentation in floating state
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
