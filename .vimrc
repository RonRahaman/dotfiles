" ===============================================================
" GENERAL OPTIONS
" ===============================================================

                        " STATUS LINE
set laststatus=2        " Last window always has a status line
set ruler               " Show cursor position in status line

                        " TABS
set expandtab           " Use spaces to insert a <Tab>
set shiftwidth=2        " # of spaces for each auto- and re-indent
set softtabstop=2       " # of spaces used for <Tab> in insert mode
set tabstop=2           " # of spaces used to display an existing <Tab>

                        " SYNTAX HIGHLIGHTING, INDENTING, AND FOLDING
syntax on               " Syntax highlighting with user's current colors
" syntax enable          " Syntax highlighting with Vim's default colors
filetype plugin on      " Load plugin files for specific filetype
                        " (eg, load ~/.vim/ftplugin/python.vim for *.python)
filetype indent on      " Load the indent file for a specific filetype
set foldmethod=syntax   " Fold with syntax items

                        " DIFF MODE
set diffopt+=iwhite     " Ignore whitespace in diff mode

                        " INVISIBLE CHARS
" set list              " Set 'list' mode
" set listchars=tab:▸\  " Set two characters used to show a tab

" Remap <C-a>, because I use it for screen and tmux
map <C-a> <Esc>
                      
" Set font for gvim
if has('gui_running')
  set guifont=Ubuntu\ Mono\ 10
endif

" ===============================================================
" FILE-SPECIFIC OPTIONS
" ===============================================================

                                  " FORTRAN
let fortran_free_source=1         " Assume free-source form for Fortran 90+
let fortran_do_enddo=1            " Indent do-loops 
"let fortran_more_precise=1       " More precise (but slower) syntax coloring
let fortran_fold=1                " Enable folding with foldmethod=syntax
"let fortran_fold_conditionals=1  " Fold if-blocks, do-loops, select-case

                                  " LATEX
let g:tex_flavor='latex'          " Default to 'tex' instead of 'plaintex'

" Force filetype detection for unusual extenstions
autocmd BufReadPost,BufRead,BufNewFile *.okl set filetype=cpp
autocmd BufReadPost,BufRead,BufNewFile *.md  set filetype=markdown

" ===============================================================
" THIRD-PARTY PLUGINS
" ===============================================================

" Tim Pope's Pathogen
execute pathogen#infect()

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
