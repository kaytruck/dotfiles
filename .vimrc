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

" vi協調モード
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2ja()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
" ノーマルモードでIMEオフ
autocmd InsertLeave * call Fcitx2en()
" 挿入モードでIMEオン
"autocmd InsertEnter * call Fcitx2ja()
