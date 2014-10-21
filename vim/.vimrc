" Load the plugin manager
call pathogen#infect()

" Appearance Settings
syn on
color darkblue
color wombat256
color xoria256
behave xterm
if has("gui_running")
	set guioptions=aegimrLt
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
		hi Normal ctermbg=NONE
	elseif has("gui_macvim")
		set guifont=Monaco:h12
	elseif has("gui_win32")
		behave mswin
		set guifont=Consolas:h11
	end
else
	hi Normal ctermbg=NONE
endif

" override certain colors in every scheme
"
" make Folded text gray with no background
hi Folded ctermfg=grey ctermbg=NONE guifg=gray guibg=NONE
" clear backgrounds where they aren't needed
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SpecialKey ctermbg=NONE guibg=NONE
" force the paren-matching colors to be simple so they dont get confused with the cursor
hi MatchParen cterm=underline gui=underline ctermbg=NONE ctermfg=white guibg=NONE guifg=white
hi StatusLine ctermbg=darkblue ctermfg=white


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
set timeoutlen=300 " ms gap between mapping keys
set visualbell " errors flash instead of beep
set autoread " dont warn about files that changed on disk, just read them
set modeline " turn on modelines feature (looks for comments containing file-specific settings)
set modelines=10 " reads this many lines of the file
filetype plugin on " load ftplugins

" how to fold
set foldenable
set foldmethod=indent

" how to indent
" indent using tabs, one <Tab> key inserts one tab character.
" tab characters appear as 2 visual spaces
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent " I forget
set noautoindent " what all
set nocindent " these do.

" uncomment this to silently replace tabs with spaces
" set expandtab

" General mappings
"
" Toggle line numbers
:map ,l :set number!<Enter>

" Knock out these (out-dated) default mappings
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop> " causes a `man` lookup, almost never useful today

" Mappings that work on whole indented blocks
:map ,d zcdd " fold + delete
:map ,> zc>> " fold + indent
:map ,< zc<< " fold + unindent
:map ,y zcY " fold + yank

" bind some build hotkeys
:map  <F5>    :wa<CR>:make debug<CR>
:map  [15~  :wa<CR>:make debug<CR>
:map  <F6>    :wa<CR>:make<CR>
:map  [17~  :wa<CR>:make<CR>
:map  <F7>    :wa<CR>:make run<CR>
:map  [18~  :wa<CR>:make run<CR>
imap  <F5>   <Esc>:wa<CR>:make debug<CR>
imap  [15~ <Esc>:wa<CR>:make debug<CR>
imap  <F6>   <Esc>:wa<CR>:make<CR>
imap  [17~ <Esc>:wa<CR>:make<CR>
imap  <F7>   <Esc>:wa<CR>:make run<CR>
imap  [18~ <Esc>:wa<CR>:make run<CR>

" dont treat '#' as special
inoremap # x<Backspace>#

" Move quickly between splits (in all different terminals, ugh)
:map  <C-Up>    <C-w><Up><C-w>_
:map  0a      <C-w><Up><C-w>_
:map  Oa      <C-w><Up><C-w>_
:map  [1;5A   <C-w><Up><C-w>_
:map  <C-Down>  <C-w><Down><C-w>_
:map  0b      <C-w><Down><C-w>_
:map  Ob      <C-w><Down><C-w>_
:map  [1;5B   <C-w><Down><C-w>_
:map  <C-Left>  <C-w><Left>
:map  0d      <C-w><Left>
:map  Od      <C-w><Left>
:map  [1;5D   <C-w><Left>
:map  <C-Right> <C-w><Right>
:map  0c      <C-w><Right>
:map  Oc      <C-w><Right>
:map  [1;5C   <C-w><Right>
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
:map <C-d> :q<cr>
imap <C-d> <Esc>:q<cr>

" Ctrl-S saves (not all terminals can send it but just in case)
:map <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>

" Tab mappings
:map  <C-t>     :tabnew<cr>
:map          :tabnew<cr>
:map  <C-Tab>   :tabnext<cr>
:map  [1;5I   :tabnext<cr>
:map  <C-S-tab> :tabprev<cr>
:map  [1;6I   :tabprev<cr>
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

" Python mappings
au! FileType python runtime! autoload/pythoncomplete.vim

" Go mappings
au BufRead,BufNewFile *.go set filetype=go

" JSON mappins
au BufRead,BufNewFile *.json set filetype=javascript

au FileType javascript let g:syntastic_javascript_closurecompiler_path="/Users/jldailey/compiler.jar"

" CoffeeScript mappings

" If you have something visually selected: ',p' will show you the
" compiled version.
au FileType coffee vmap ,p y:!coffee -bce '<C-R>"'<CR>

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

" Configure the Git Gutter plugin
let g:gitgutter_enabled = 1
hi SignColumn ctermbg=NONE guibg=NONE
hi lineAdded ctermfg=green ctermbg=NONE guifg=green
hi lineRemoved ctermfg=red ctermbg=NONE guifg=red
hi lineModified ctermfg=yellow ctermbg=NONE guifg=yellow

" Force files into utf-8 mode
scriptencoding utf-8
set encoding=utf-8

" Show whitespace characters as special symbols
set listchars=tab:›\ ,precedes:‹,extends:›,trail:…
set nolist
:map ,L :set list!<CR>
