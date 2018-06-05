
" General Vim configuration first
syntax enable
color candy
set background=dark
set t_Co=256
set cursorline                  " highlight current line
hi cursorline guibg=\#333333     " highlight bg color of current line
hi CursorColumn guibg=\#333333   " highlight cursor
set ts=2 sw=2 et

set nu                          " Line numbers on
set wrap
set ignorecase
set showmatch                   " show matching
set paste
set history=1000
set backup                      " backups are nice 
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
set wildmenu


" Plugins to load

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'maksimr/vim-jsbeautify'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'

call plug#end()


" vim-Airline statusbar settings

set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"  remap search keys to use incsearch plugin for highlighting

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <c-j> :call JsBeautify()<cr>


" sidebar nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"  Indent settings to show level of indentions

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234


" Tagbar toggle
nmap <Leader>tt :TagbarToggle<cr>

function! InitializeDirectories()
   let separator = "."
   let parent = $HOME 
   let prefix = '.vim'
   let dir_list = { 'backup' : 'backupdir', 'views' : 'viewdir', 'swap': 'directory' }

   for [dirname, settingname] in items(dir_list)
       let directory = parent . '/' . prefix . '/' . dirname . "/"
       if exists("\*mkdir")
           if !isdirectory(directory)
               call mkdir(directory)
           endif
       endif
       if !isdirectory(directory)
           echo "Warning: Unable to create backup directory: " . directory
           echo "Try: mkdir -p " . directory
       else  
           let directory = substitute(directory, " ", "\\\\\\\\ ", "")
           exec "set " . settingname . "=" . directory
       endif
   endfor
 endfunction
 call InitializeDirectories() 

