" ------------ Actions outside of this script ---------------
" Preview quickfix results
" Put into ~/.vim/after/ftplugin/qf.vim:
"   nnoremap <buffer> o <CR><C-W>p
"
" -----------------------------------------------------------
set nocompatible

let atgoogle = filereadable(glob('~/.vimrc_google'))

" Use ~/.vim/swapfiles/ for .swp
set directory=$HOME/.vim/swapfiles//

" Use C-d for Esc.
inoremap <C-d> <Esc>

" Change <Leader> to space
let mapleader = "\<Space>"

" Dvorak Movement Keys.
" Add g to go by screen (not physical) line
noremap h h
noremap t j
noremap n k
noremap s l
noremap gt gj
noremap gn gk

" Back and forward in jump list
noremap - <C-o>
noremap _ <C-i>

" Page down and page up
"noremap T <C-f>
"noremap N <C-b>

" Half page down and half page up
noremap T <C-d>
noremap N <C-u>

" C-t to scroll down a line, C-n to scroll up a line
"noremap <C-t> <C-e>
"noremap <C-n> <C-y>

" Fix j, k, n, and s displaced by movement keys
noremap l s
noremap L S
noremap j n
noremap k N

" Set ENTER to insert newline in command mode
"noremap <CR> i<CR><Esc>

" Easy access to begin and end. g means go by screen (not physical) line
noremap H g^
noremap S g$

" CTRL-K for descend into tag
" noremap <C-j> <C-]>
noremap <C-k> <C-]>

" Set max number of open tabs to 50
set tabpagemax=50

" Changing tabs
"noremap <C-h> gT
"noremap <C-s> gt

" Changing windows
nnoremap <M-h> <C-w>h
nnoremap <M-s> <C-w>l
nnoremap <M-t> <C-w>j
nnoremap <M-n> <C-w>k

" Open and navigate quickfix results
noremap <Leader>q :cope<CR>
noremap <Leader>n :cn<CR>
noremap <Leader>p :cp<CR>

" Go backwards and forwards in jumplist
"noremap <C-b> <C-o>
"noremap <C-m> <C-i>

" Buffer management
"set switchbuf=usetab,newtab

" Use two semicolons for esc
":imap ;;  <Esc>
":set timeoutlen=300

" Turn line numbering on
set nu
set relativenumber

" Keep 4-line margin at top and bot of screen.
set scrolloff=4

" Change the background color of the cursor's line number.
set cursorline
highlight CursorLineNr term=bold ctermbg=Red ctermfg=Yellow

" Disable underlining the cursor line itself.
highlight CursorLine term=NONE cterm=NONE

" Change the search highlight color.
highlight Search term=reverse cterm=reverse ctermbg=black ctermfg=yellow

" Change the visual mode color.
highlight Visual term=reverse cterm=reverse ctermbg=black

" Turn autoindent on
set ai

" Set up file-type dependent indent
filetype indent on

" Turn syntax highlighting on
syntax on

" Configure tab behavior
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Search tweaks
set incsearch
set ignorecase
set smartcase
set hlsearch

" Fix file completion
set wildmenu
set wildmode=longest:full

" Allow the mouse to move cursor
" set mouse=a

" Allow switching buffers when dirty.
set hidden

" Enable visual word wrap (no EOLs inserted into actual file)
set linebreak

" Swap ; and :. Convenient.
noremap : ;
noremap ; :

" Swap ` and '. Convenient for jumping to exact marks.
noremap ' `
noremap ` '

" Swap , and ;. Convenient for repeating f and t motions.
nnoremap , ;
nnoremap : ,


" Press F3 to toggle automatic word wrapping
"noremap <F3> :set wm=2<CR>

" Press F4 to toggle highlighting on/off, and show current value.
"noremap <F4> :set hlsearch! hlsearch?<CR>

" Map CTRL-A to toggle spell checking
"noremap <C-a> :set spell! spell?<CR>
"noremap <C-j> [s
"noremap <C-k> ]s
"noremap <C-x> z=

" Press C-l to turn off highlighting and clear any message already displayed.
nnoremap <silent> <C-l> :call clearmatches()<Bar>:nohlsearch<Bar>:echo<CR><C-l>

" Make man page appear in a vim window using :Man command
runtime! ftplugin/man.vim

" Sudo write current file
"cmap W w !sudo tee >/dev/null %

" Show status line at the bottom of the screen
set ruler
set rulerformat=%50(%=%n\:%f%m%r%w\ %l,%c%V\ %P%)

" Correct vimdiff color scheme when using dark background
hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
hi DiffText term=reverse  cterm=bold ctermbg=yellow ctermfg=black
hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

"syntax enable
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized

"let g:rehash256 = 1
"colorscheme molokai


" Make diff always split vertically.
set diffopt=vertical

" Map F1 to toggle paste mode
noremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>
set showmode

" Make it easy to edit and source vimrc
noremap <Leader>s :source ~/.vimrc<CR>
noremap <Leader>v :e ~/.vimrc<CR>

noremap <Leader>V :e ~/.vimrc_google<CR>

" Grep files in quick fix
noremap <Leader>gr :grep --exclude-dir=scons-out -nir '

" Make highlighting reverse the text color
"hi Visual ctermbg=NONE cterm=reverse
"hi Search ctermbg=NONE cterm=reverse
"hi SpellBad ctermbg=NONE cterm=reverse
"hi MatchParen ctermbg=black cterm=None

" Fix the omni complete menu color
hi Pmenu ctermbg=lightgray
hi PmenuSel ctermbg=lightyellow

" Show the command that you're currently typing
" set showcmd

" Set title
set title

" Remap keys in NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeMapOpenInTab='e'
let g:NERDTreeMapOpenInTabSilent='E'
let g:NERDTreeMapOpenExpl='~'

let g:NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1


" Automatically enter paste-mode when CTRL-V'ing into insert mode.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Visual mode: pressing * or ? searches for the current selection.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> ? :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>


" Open the corresponding .cc file from a .h file.
noremap <Leader>c :edit %:p:s?\.h$?.cc?<CR>

" Open the corresponding .h file from a .cc file.
noremap <Leader>h :edit %:p:s?\.cc$?.h?<CR>

" Ignore object and class files when doing file expansion.
set wildignore+=*.o,*~,*.class,*.pyc,scons-out

highlight ColorColumn ctermbg=lightcyan

" 80-char margin for cpp files.
filetype on
autocmd FileType cpp setlocal colorcolumn=81

" Automatically refresh buffer from file.
set autoread

" Refresh all open buffers from files.
noremap <leader>a :checktime<CR>

" Highlight occurrences of the current word
noremap <Leader>, :silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))<CR>

" Set 256 colors
set t_Co=256

"

""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

if (!atgoogle)
  "Plug 'Valloric/youcompleteme'
endif
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
"Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/neomru.vim'
"Plug 'sjbach/lusty'
Plug 'rosenfeld/conque-term'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Better handling of CamelCase and underscore_delimiters
Plug 'bkad/camelcasemotion'
"Plug 'kana/vim-textobj-user'
"Plug 'julian/vim-textobj-variable-segment'

"Plug 'fholgado/minibufexpl.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'preservim/nerdtree'

call plug#end()

""""""""""""""""""""""""""""""""
" End vim-plug section.
""""""""""""""""""""""""""""""""

"------ YouCompleteMe flags default location for C-family completion via Clang
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/*']

" C-d for go to definition.
noremap <C-d> :YcmCompleter GoToImprecise<CR>
noremap <C-f> :YcmCompleter GoTo<CR>

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 1
set completeopt-=preview

highlight YcmErrorSection ctermbg=blue term=underline
highlight YcmWarningSection ctermbg=lightblue term=underline

" Do not display "Pattern not found" messages during YouCompleteMe completion
" " Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
try
  set shortmess+=c
  catch /E539: Illegal character/
endtry
"------ End YouCompleteMe

"------ Begin vim-dispatch
noremap <Leader>r :Dispatch ant debug && ./install_and_run.sh<CR>
noremap <Leader>d :Dispatch
"------ End vim-dispatch

"------ Begin QuickFix Enter
let g:qfenter_topen_map = ['<C-t>']
"------ End QuickFix Enter

"------ Begin Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1

noremap <Leader>m :MultipleCursorsFind

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
"------ End Multiple Cursors

"------ Begin fzf
nnoremap <leader>t :Files<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>o :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>l :BLines<CR>
"------ End fzf

"------ Begin CamelCaseMotion
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
omap iW <Plug>CamelCaseMotion_iw
xmap iW <Plug>CamelCaseMotion_iw
"------ End CamelCaseMotion

"------- Begin LustyJuggler
noremap <Leader>u :LustyJuggler<CR>
let g:LustyJugglerKeyboardLayout = "dvorak"
"------- End LustyJuggler

"------- Begin Conque-term
let g:ConqueTerm_EscKey = '<C-c>'
"------- End Conque-term

"------- Begin airline
set laststatus=2
"------- End airline

"------ Begin vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-t> :TmuxNavigateDown<cr>
nnoremap <silent> <C-n> :TmuxNavigateUp<cr>
nnoremap <silent> <C-s> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
"------ End vim-tmux-navigator

"------ Epilogue scripts

filetype plugin indent on
autocmd filetype python setlocal sw=2 ts=2 sts=2 expandtab


" Make vp not replace paste buffer, allowing for multiple pastes
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" (MacOSX) Make vim copy to system clipboard by default.
"set clipboard+=unnamed

if (atgoogle)
  source ~/.vimrc_google
endif
