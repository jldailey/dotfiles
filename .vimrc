colo darkblue


set exrc
set nocompatible
set backspace=2 " allow backspace over anything in insert mode
set nobackup
set viminfo='20,\"50
set history=50
set ruler

set noswapfile

set foldenable
set foldmethod=indent
set noautoindent
set smartindent
set nocindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
" set expandtab " use spaces instead of tabs

set number "line numbers on the left                                                                                         
" map ,L to toggle line numbers (for copy/paste mostly)                                                                 
map ,l :set number!<Enter>

" cfml comment
au BufRead,BufNewFile *.cfm noremap ,c I<!--- <Esc>A ---><Esc>
au BufRead,BufNewFile *.cfm noremap ,u ^:s/<!--- *//<Cr>/---><Cr>:s/ *--->//<Cr>

" py comments
au BufRead,BufNewFile *.py noremap ,c I# <Esc>
au BufRead,BufNewFile *.py noremap ,u :s/$\(\s*\)#\s/\1/

" auto complete html comments
au BufRead,BufNewFile *.html inoremap <!-- <!-- --><Esc>hhhi

" map ,h do a help search
map ,h :!cmd /c start ' http://www.google.com/search?q=site:livedocs.adobe.com/flex/2/langref\%20\%20^R^W'<CR>

" d> deletes the current indent block that starts on the current line
" map d> jzck3dd
" z> indents the current indent block below us
" map z> jzck3>>
" map z< jzck3<<
" yz yanks the current indent block
" map y> jzck3Yjzok

" bind some build hotkeys
map <F5> :wa<Enter>:make debug<Enter>
map <F6> :wa<Enter>:make<Enter>
map <F7> :wa<Enter>:make run<Enter>

inoremap # x<Backspace>#

imap Oa <Esc><C-w><Up><C-w>_
imap Ob <Esc><C-w><Down><C-w>_
map Oa <Esc><C-w><Up><C-w>_
map Ob <Esc><C-w><Down><C-w>_

au BufRead,BufNewFile *.go set filetype=go

au! Syntax go source $VIM/go.vim

" <mx:Script> should auto-fill with CDATA tags
:imap <mx:Script> <mx:Script><CR><![CDATA[<CR>]]><CR></mx:Script><Up><Up><Right><CR>

" do not jump to the location of errors, annoying with relative vs. absolute paths
" set errorformat=""

set nowrap

let g:xml_syntax_folding = 1
syn on    
hi Folded ctermfg=0 ctermbg=NONE

autocmd FileType python runtime! autoload/pythoncomplete.vim

autocmd FileType html imap <script <script type="text/javascript"
autocmd FileType html imap <style <style type="text/css"
autocmd FileType html imap <link <link rel="stylesheet" href="

call pathogen#infect()
