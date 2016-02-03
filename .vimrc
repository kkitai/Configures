"新しい行のインデントを現在の行と同じにする
set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"ステータスラインに文字コードと改行コードを表示させる
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"256 color
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
"ctags
set tags+=tags;
"構文ハイライトを有効
syntax on
"カラースキーム
colorscheme BlackSea
"colorscheme advantage
"ファイルの種類ごとに設定を有効化
filetype plugin on
"TODO管理
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.jade **/*.py **/*.php **/*.rb **/*.js **/*.erb **/*.haml<CR>:cw<CR>
"スワップファイルを作成しない
set noswapfile
"特殊文字可視化
"set listchars=tab:>-,eol:↲
set listchars=tab:>-,trail:-
set list
" 文字コードの自動認識
if $LANG =~? "utf-8"
  set termencoding=utf-8
  set encoding=utf-8
  set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
elseif $LANG =~? "sjis"
  set termencoding=cp932
  set encoding=cp932
  set fileencodings=iso-2022-jp,utf-8,cp932
else
  set termencoding=euc-jp
  set encoding=euc-jp
  set fileencodings=euc-jp,iso-2022-jp,cp932,utf-8
endif
" ファイルタイプ
au BufRead,BufNewFile *.css setfiletype css

"""""""""
" Vundle
set nocompatible               " be iMproved
filetype off                   " required!

    set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'tpope/vim-rails.git'
    Bundle 'tpope/vim-pathogen'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'Shougo/unite.vim.git'
    Bundle 'h1mesuke/unite-outline'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'isRuslan/vim-es6'
    "Bundle 'kshenoy/vim-signature'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'Shougo/neocomplcache.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'hdima/python-syntax'
    Bundle 'vim-scripts/Emmet.vim.git'
    " vim-scripts repos
    Bundle 'L9'
    Bundle 'FuzzyFinder'
    Bundle 'grep.vim'
    Bundle 'Mark'
    " non github repos
    Bundle 'git://git.wincent.com/command-t.git'
    " ...

    filetype plugin indent on     " required!
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..



"""""""""
" Fuzzy Finder

" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" FuzzyFinder.vim
nnoremap <silent> fb :<C-u>FufBuffer<CR>
nnoremap <silent> ff :<C-u>FufFile **/<CR>
nnoremap <silent> fm :<C-u>FufMruFile<CR>

let g:fuf_file_exclude = '\v\~$'
            \ . '|\.(o|png|PNG|JPG|class|CLASS|jpg|exe|bak|swp)$'
            \ . '|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
            \ . '|(^|[/\\])node_modules[/\\]'
            \ . '|(^|[/\\])bower_components[/\\]'


"""""""""
" vim-powerline

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"""""""""
" unite-outline
noremap <C-O> :Unite outline<CR>

""""""""
" grep.vim
nnoremap <silent> gr :Rgrep<CR>

""""""""
" syntastic.vim
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args='-standard=psr2'
let g:syntastic_python_checkers=['python','pylint']
let g:syntastic_javascript_checkers=['jshint']

""""""""
" Mark
nmap <silent> mm \m
nmap <silent> mn \*
nmap <silent> mp \#

""""""""
" python-syntax
let python_highlight_all = 1
