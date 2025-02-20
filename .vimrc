let skip_defaults_vim=1
syntax on
set modelines=0
set nocompatible
set number
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set mouse=a
set laststatus=2
set backspace=2
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
au BufWrite /private/etc/pw.* set nowritebackup nobackup
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit\|rebase'
  \ |   exe "normal! g`\""
  \ | endif