syntax on

set termguicolors
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
colorscheme onedark



vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Themes luna gruvbox_material bubblegum minimalist raven ravenpower solarized
let g:airline_solarized_bg='dark'
let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1


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
inoremap {{ {{  }}<left><left><left>
inoremap {<CR> {<CR>}<Esc><S-o>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Shows documentation in floating state
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Prettier on save
nnoremap <S-f> <cmd>Prettier<cr>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
