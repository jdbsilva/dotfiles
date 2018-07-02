" NEVER PUT ANYTHING IN YOUR .VIMRC THAT YOU DO NOT UNDERSTAND " 
execute pathogen#infect()

" set UTF-8
set fileencoding=utf8

" add status bar
set laststatus=2

" add current path to statusline
" set statusline+=%F
"set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}
set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ \ %{strftime('%F')}

" turning off auto indent when pasting text into vim
set paste

" set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" attempt to determine the type of a file based on its name and possibly its
" contents; use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" number the lines
set number

" highlight keywords
syntax on

" 256-color terminal
" this needs to be set before colorscheme 
set t_Co=256

" define default color scheme
colorscheme molokai
"colorscheme molokayo 
"colorscheme gruvbox 
"colorscheme happy_hacking 

" set 1 tab character to 4 spaces characters
set tabstop=4

" set an indent to 4 spaces characters 
set shiftwidth=4

" do not wrap lines
set nowrap

" use the actual tab character instead of spaces in the source
set softtabstop=0 noexpandtab

" show command in bottom bar
set showcmd

" highlight current line
set cursorline          

" visual autocomplete for command menu
set wildmenu            

" highlight matching [{()}]
set showmatch

" load filetype-specific indent files
filetype indent on

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to.
set lazyredraw

" the first line maps escape to the caps when you enter vim; the second
" returns to normal functionality once you quit vim.
" this requires Linux with the xorg-xmodmap package installed.
" au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" So that default compilation is PDF
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" disable arrow keys in escape/normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list

" Markdown configuration
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0

let g:vim_markdown_folding_level = 6



