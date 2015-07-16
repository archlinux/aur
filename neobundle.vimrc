"Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!
    " Original repos on github
    NeoBundle 'tpope/vim-fugitive'
    
    " vim-scripts repos
    NeoBundle 'FuzzyFinder'
    
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck

