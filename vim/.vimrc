" Options de base {

    set nocompatible                " Mode non-compatible avec Vi
    set showmode                    " Montre le mode actuel
    set showcmd                     " Montre le nombre de lignes selectionnes en mode visuel
    set backspace=indent,eol,start  " Backspace avec un fonctionnement normal
    set ruler                       " Affiche la position du curseur en bas d ela fenetre
    set nohlsearch
    set incsearch                   " Le curseur se déplace sur le résultat de recherche au fur et à mesure de la saisie
    set ignorecase
    set smartcase                   " Recherche à casse intelligente.
    set wildmenu
    set expandtab                   " Convert from tab to spaces
    set title

    syntax enable                   " Coloration Syntaxique

    runtime ftplugin/man.vim        " Load man plugin
    let $PAGER='less'

    set tags=tags;/                 " Load tagfile from current directory. If no tagfile found, search in parent directory

    " Clojure
    let g:clj_highlight_builtins=1
    let g:clj_paren_rainbow=1

    au BufEnter *.md set syntax=markdown

" }

" Folds {

    au BufEnter * set foldmethod=syntax
    au BufEnter *.py set foldmethod=indent
    au BufEnter * normal zR
    map <C-c> zc
    map <C-x> zo

" }

" Taille des tabulations et de l'indentation {
    set shiftwidth=4
    set softtabstop=4
" }

" Interface {

    " Numeros de lignes a gauche {

        set number
        highlight LineNr ctermfg=brown

    " }

    " Couleurs du menu d'autocompletion, des folds, des commentaires et du highlight de recherche {

        highlight Pmenu ctermbg=black ctermfg=white
        highlight PmenuSel ctermbg=white ctermfg=black
        highlight Search ctermbg=yellow ctermfg=black
        highlight Folded ctermbg=none ctermfg=yellow
        highlight Comment ctermfg=darkgrey

    " }

    " Configuration de list {

        set listchars=eol:¤,tab:>~,trail:¤
        highlight SpecialKey cterm=underline ctermfg=red
        highlight NonText ctermfg=brown

    " }

    " Highlight de la ligne courante {

        set cursorline
        highlight CursorLine cterm=bold

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

" Abreviations {

    ab #i       #include
    ab #d       #define

" }

" Plugins {

    filetype plugin on
    filetype indent on

" }

" Commenter / Decommenter {

    vmap <silent> <space> :s/^/\/\//<CR>
    vmap <silent> <S-z> :s/^\/\//<CR>

" }

" Quelques mappages {

    map             <F2>        :set list!\|set list?<CR>
    map             <F3>        :set hlsearch!\|set hlsearch?<CR>
    map             M           :Man 
    map             B           :Gblame<CR>
    nnoremap        K           :Man <cword><CR>
    imap            <Nul>       <Space>

    " Map completion sur C-Space
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " Recherche de la sélection en visual-mode
    vnoremap        <silent> *  :call VisualSearch('f')<CR>
    vnoremap        <silent> #  :call VisualSearch('b')<CR>

" }

function! VisualSearch(direction) range
  let l:saved_reg   = @"
  execute "normal! vgvy"

  let l:pattern     = escape(@", '\\/.*$^~[]')
  let l:pattern     = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/            = l:pattern
  let @"            = l:saved_reg
endfunction


