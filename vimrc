" Auto install vim-pug
" See https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"
" Config for sheerun/vim-polyglot 
"

" Ignore Rust, leave it for rust-lang/rust.vim plugin
let g:polyglot_disabled = ['rust']

" Specify desire plugins
" Need to type :PlugInstall to trigger installing inside vim
" Note: order is matter
call plug#begin('~/.vim/plugged')
" tagbar plugin needs ctags installed first, see below doc for installing
" https://docs.ctags.io/en/latest/building.html
" rust.vim plugin depends on tagbar plugin for outlining structure
Plug 'majutsushi/tagbar'

" An universal set of defaults for vim
Plug 'tpope/vim-sensible'

" For Rust language
Plug 'rust-lang/rust.vim'

" For syntax highlight
Plug 'sheerun/vim-polyglot'

" For browsing file/folder in tree
Plug 'preservim/nerdtree'
call plug#end()

" Load vim-sensible plugin earlier so that we can override them in below
" See https://github.com/tpope/vim-sensible#faq
runtime! plugin/sensible.vim

"
" General config
"
set ruler

" Allow backspacing over everything in insert mode 
set backspace=indent,eol,start

" Set indent for python and proto language
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType proto setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

"
" Plugin preservim/nerdtree config
"

" show hidden file
let NERDTreeShowHidden=1

" ignore files in nerd tree
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '__pycache__', '\.pyc$', '\.sw.$'] 

"
" Plugin 'rust-lang/rust.vim' config
"

" enable automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1

