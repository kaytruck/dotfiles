"----------------------------------------------------------
"基本設定
"----------------------------------------------------------
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

"----------------------------------------------------------
" vi協調モード
"----------------------------------------------------------
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

"----------------------------------------------------------
"プラグインの導入
"----------------------------------------------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/kta/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/kta/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('google/vim-ft-go') "最新版のvimでは組み込み済みのため不要らしい
call dein#add('vim-jp/vim-go-extra')
call dein#add('vim-jp/vimdoc-ja') "ヘルプの日本語化プラグイン
call dein#add('thinca/vim-quickrun')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"----------------------------------------------------------
"プラグインの設定
"----------------------------------------------------------
" netrw
" 常にツリー表示
let g:netrw_liststyle = 3

" Go言語
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

