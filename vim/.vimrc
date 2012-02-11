
" Options de base {

    set nocompatible		    " Mode non-compatible avec VI
    set showmode		    " Montre le mode actuel
    set showcmd			    " Montre le nombre de lignes selectionnes en mode visuel
    set backspace=indent,eol,start  " Backspace avec un fonctionnement normal
    set ruler			    " Affiche la position du curseur en bas d ela fenetre
    set nohlsearch
    set incsearch		    " Le curseur se déplace sur le résultat de recherche au fur et à mesure de la saisie
    set ignorecase
    set smartcase		    " Recherche à casse intelligente.
    set wildmenu
    set expandtab		    " Convert from tab to spaces

    syntax enable		    " Coloration Syntaxique

    runtime ftplugin/man.vim	    " Load man plugin
    let $PAGER='less'

" }

" Folds {

    au BufEnter * set foldmethod=syntax
    au BufEnter *.py set foldmethod=indent
    au BufEnter * normal zR
    map <F6> zc
    map <F7> zo
    map <C-c> zc
    map <C-x> zo

" }

" Taille des tabulations et de l'indentation {
    set shiftwidth=2
    set softtabstop=4
" }

" Interface {

    " Numeros de lignes a gauche {

	set number
	highlight LineNr ctermfg=brown

    " }

    " Highlight de la ligne courante {

        set cursorline
	highlight CursorLine cterm=bold

    " }

    " Couleurs du menu d'autocompletion, des folds, des commentaires et du highlight de recherche {

	highlight Pmenu ctermbg=black ctermfg=white
	highlight PmenuSel ctermbg=white ctermfg=black
	highlight Search ctermbg=lightgreen ctermfg=white
	highlight Folded ctermbg=none ctermfg=yellow
	highlight Comment ctermfg=darkgrey

    " }

" }

" Indentation {

    set autoindent
    filetype on
    autocmd FileType c set cindent
    autocmd FileType cpp set cindent
    autocmd FileType perl set cindent
    autocmd FileType python set cindent

" }

" Norme {

    au BufWinEnter *.c,*.h let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1) " Montre si une ligne fait plus de 80 colones dans les fichier source en C

    " Montre les espaces en fin de ligne {
	highlight Space ctermbg=white guibg=white
	au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
    " }

" }

" Abreviations {

    ab #i	#include
    ab #d	#define

" }

" Plugins {

    filetype plugin on
    filetype indent on

" 

" Commenter / Decommenter {

    vmap <silent> <space> :s/^/\/\//<CR>
    vmap <silent> <S-z> :s/^\/\//<CR>

" }

" Coloration CoffeeScript / MXML{

    au BufWinEnter *.coffee setfiletype coffee
    au BufWinEnter *.mxml set syntax=javascript

" }

" Quelques mappages {

    map		    <F3>	:set hlsearch!\|set hlsearch?<CR>
    map		    <F5>	:Man 
    nnoremap	    K		:Man <cword><CR>
    imap	    <Nul>	<Space>
    imap	    <C-Space>	<C-N>

    " Recherche de la sélection en visual-mode
    vnoremap	    <silent> *	:call VisualSearch('f')<CR>
    vnoremap	    <silent> #	:call VisualSearch('b')<CR>

" }

function! VisualSearch(direction) range
  let l:saved_reg   = @"
  execute "normal! vgvy"

  let l:pattern	    = escape(@", '\\/.*$^~[]')
  let l:pattern	    = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/	    = l:pattern
  let @"	    = l:saved_reg
endfunction

