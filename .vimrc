" Appearance Settings
call pathogen#infect()
syn on
color darkblue
color Tomorrow-Night
color wombat256
hi Folded ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE " force all color schemes to grey-out folded text
" uncomment if you want Ctrl-V and Ctrl-C as your copy/paste keys
" source $VIMRUNTIME/mswin.vim
behave xterm
set guifont=Inconsolata:h14,Consolas:h10,Monaco:h12

" General Settings
set exrc
set nocompatible
set laststatus=2
set backspace=2 " allow backspace over anything in insert mode
set nobackup " dont create ~ backup files
set noswapfile " dont create .swp files
set viminfo='20,\"50 " what to save in ~/.viminfo
set history=50 " how much to save
set ruler
set nowrap " dont wrap long lines
set number " show line numbers on the left                                                                                         
set timeoutlen=500 " ms gap between mapping keys
set visualbell " errors flash instead of beep
set autoread " dont warn about files that changed on disk, just read them

" how to fold
set foldenable
set foldmethod=indent

" how to indent
set smartindent
set noautoindent
set nocindent
set tabstop=2 softtabstop=2 shiftwidth=2 " indent using tabs, 1 tab = 2 visual spaces
" set expandtab " uncomment to use spaces instead of tabs

" General mappings
map ,l :set number!<Enter>

" Mappings that work on whole indented blocks
map zd zcdd
map z> zc>>
map z< zc<<
map zy zcYzo

" bind some build hotkeys
map  <F5>    :wa<CR>:make debug<CR>
map  [15~  :wa<CR>:make debug<CR>
map  <F6>    :wa<CR>:make<CR>
map  [17~  :wa<CR>:make<CR>
map  <F7>    :wa<CR>:make run<CR>
map  [18~  :wa<CR>:make run<CR>
imap  <F5>   <Esc>:wa<CR>:make debug<CR>
imap  [15~ <Esc>:wa<CR>:make debug<CR>
imap  <F6>   <Esc>:wa<CR>:make<CR>
imap  [17~ <Esc>:wa<CR>:make<CR>
imap  <F7>   <Esc>:wa<CR>:make run<CR>
imap  [18~ <Esc>:wa<CR>:make run<CR>

" dont treat '#' special
inoremap # x<Backspace>#

" Move quickly between splits (in all different termainls, ugh)
map  <C-Up>    <C-w><Up><C-w>_
map  0a      <C-w><Up><C-w>_
map  Oa      <C-w><Up><C-w>_
map  [1;5A   <C-w><Up><C-w>_
map  <C-Down>  <C-w><Down><C-w>_
map  0b      <C-w><Down><C-w>_
map  Ob      <C-w><Down><C-w>_
map  [1;5B   <C-w><Down><C-w>_
map  <C-Left>  <C-w><Left>
map  0d      <C-w><Left>
map  Od      <C-w><Left>
map  [1;5D   <C-w><Left>
map  <C-Right> <C-w><Right>
map  0c      <C-w><Right>
map  Oc      <C-w><Right>
map  [1;5C   <C-w><Right>
imap <C-Up>    <Esc><C-w><Up><C-w>_
imap 0a      <Esc><C-w><Up><C-w>_
imap Oa      <Esc><C-w><Up><C-w>_
imap [1;5A   <Esc><C-w><Up><C-w>_
imap <C-Down>  <Esc><C-w><Down><C-w>_
imap 0b      <Esc><C-w><Down><C-w>_
imap Ob      <Esc><C-w><Down><C-w>_
imap [1;5B   <Esc><C-w><Down><C-w>_
imap <C-Left>  <Esc><C-w><Left>
imap 0d      <Esc><C-w><Left>
imap Od      <Esc><C-w><Left>
imap [1;5D   <Esc><C-w><Left>
imap <C-Right> <Esc><C-w><Right>
imap 0c      <Esc><C-w><Right>
imap Oc      <C-w><Right>
imap [1;5C   <Esc><C-w><Right>

" Ctrl-D closes file - controversial
map <C-d> :q<cr>
imap <C-d> <Esc>:q<cr>

" Ctrl-S saves (not all terminals can send it but just in case)
map <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>

" Tab mappings
map  <C-t>     :tabnew<cr>
map          :tabnew<cr>
map  <C-Tab>   :tabnext<cr>
map  [1;5I   :tabnext<cr>
map  <C-S-tab> :tabprev<cr>
map  [1;6I   :tabprev<cr>
imap <C-t>     <Esc>:tabnew<cr>
imap         <Esc>:tabnew<cr>
imap <C-Tab>   <Esc>:tabnext<cr>
imap [1;5I   <Esc>:tabnext<cr>
imap <C-S-tab> <Esc>:tabprev<cr>
imap [1;6I   <Esc>:tabprev<cr>

" HTML mappings
au FileType html imap <script <script type="text/javascript"
au FileType html imap <style <style type="text/css"
au FileType html imap <link <link rel="stylesheet" href="
au FileType html inoremap <!-- <!-- --><Esc>hhhi

" ActionScript mappings, outdated, mostly here as an example for the future
au BufRead,BufNewFile *.as map ,h :!cmd /c start ' http://www.google.com/search?q=site:livedocs.adobe.com/flex/2/langref\%20\%20^R^W'<CR>
au BufRead,BufNewFile *.mxml imap <mx:Script> <mx:Script><CR><![CDATA[<CR>]]><CR></mx:Script><Up><Up><Right><CR>

" Python mappings
au! FileType python runtime! autoload/pythoncomplete.vim

" Go mappings
au BufRead,BufNewFile *.go set filetype=go
au! Syntax go source $VIM/go.vim

" CoffeeScript mappings

" If you have something visually selected: ',p' will show you the
" compiled version.
vmap ,p y:!coffee -bce '<C-R>"'<CR>

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
