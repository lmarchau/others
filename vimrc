" This must be first, because it changes other options as a side effect.
set nocompatible
set number
"colorscheme murphy


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
set nobackup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set tabstop=2
set shiftwidth=4
""set textwidth=78
" "set expandtab
"
map <F10> :colorscheme morning<CR>
map <F11> :colorscheme default<CR>

"Autoremove ^M in DOS files
""autocmd BufRead * silent! %s/^M$//

imap ( ()<Left>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
imap [ []<Left>
imap { {}<Left>
"imap { {<CR><CR>}<Up>

" Pour le HTML
" imap '' <LEFT>&<RIGHT>acute;
" imap `` <LEFT>&<RIGHT>grave;
" imap ~~ <LEFT>&<RIGHT>tilde;
" imap ^^ <LEFT>&<RIGHT>circ;
" imap >> >><ESC>?<<CR>wyw/>><CR><Right>i</<ESC>p?></<CR><Right>i

" Folding in VIM :)
" a. Create a fold:
" 1. go at the first line;
" 2. press Shift-V and arrow down;
" 3. hit 'zf'.
" b. Unfold:
" 1. go at the folded line;
" 2. press rigth arrow or 'fz'.

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("gui_running")
"	set guifont:terminal
"	set guifont=monospace
endif

if &t_Co > 2 || has("gui_running")
  syntax on
endif

set laststatus=2
set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
