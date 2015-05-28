if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'google/vim-ft-go' "最新版のvimでは組み込み済みのため不要
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'vim-jp/vimdoc-ja' "ヘルプの日本語化プラグイン
NeoBundle 'thinca/vim-quickrun'

call neobundle#end()

syntax on
filetype plugin indent on

NeoBundleCheck

" 行番号を表示
set number

" ファイルエンコーディングの設定
set fenc=utf-8
set fencs=utf-8,sjis,iso-2022-jp

" バックアップファイル、スワップファイルを作らない
set nobackup
set noswapfile

" インデントを超えて削除、改行を超えて削除、挿入モード開始位置を超えて削除
set backspace=indent,eol,start

" netrw
" 常にツリー表示
let g:netrw_liststyle = 3

" Go言語
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
