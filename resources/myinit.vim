set nocompatible
set hidden

call plug#begin('~/.config/nvim/plugged')

" 管理vundle插件本身
Plug 'gmarik/vundle'

" 我的插件

" 1. 操作相关
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

" Plug 'godlygeek/tabular'
" Plug 'tpope/vim-repeat'

" Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'szw/vim-ctrlspace'
" Plug 'a.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Lokaltog/vim-easymotion'

" git

Plug 'tpope/vim-fugitive'

" 2. ui相关
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'

" vim 对齐显示
" Plug 'nathanaelkane/vim-indent-guides'

" 3. 语言相关
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'othree/html5.vim'
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Plug 'fatih/vim-go'
" Plug 'plasticboy/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'

" 语法检查
" Plug 'scrooloose/syntastic'

" 工具
" Plug 'tpope/vim-rvm'

" 一些新的功能
Plug 'taglist.vim'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
"Plug 'Lokaltog/vim-powerline'
Plug 'majutsushi/tagbar'
Plug 'grep.vim'

call plug#end()

filetype plugin indent on

filetype on
filetype indent on
filetype plugin on

syntax enable

" 设置备份文件的路径

" 路径必须存在，否则某些插件/功能会报错
set undodir=~/.config/nvim/undo/
set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/swp/


" 设置语法高亮的配色
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
hi Visual ctermfg=Black

" 自动缩进
set autoindent

"用<>调整缩进时的长度
set shiftwidth=2

"制表符的长度，统一为4个空格的宽度
set tabstop=2

"显示行号
" set number

"行号栏的宽度
set numberwidth=4

" 共享剪贴板
set clipboard+=unnamed

"禁止自动换行
set nowrap

" nerdcommenter 
let NERDSpaceDelims=1

"在输入命令时列出匹配项目
set wildmenu

"显示光标位置
set ruler

"分割窗口时保持相等的宽/高
set equalalways

" 设置分割
set fillchars+=vert:│
" hi vertsplit guifg=fg guibg=bg gui=NONE
hi VertSplit ctermbg=NONE guibg=NONE


"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]

"取消自动备份
"set nobackup

"保存关闭文件之前保留一个备份
"set writebackup

"设置自定义的<leader>快捷键
let mapleader=","

""""""""""""""""""""""""""""""
" NERDTree插件配置
""""""""""""""""""""""""""""""
noremap  <F2> :NERDTreeTabsToggle<cr>
"noremap <C-n><esc> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeTabsToggle<cr>

" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
inoremap <F9> <esc>:NERDTreeFind<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=0
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""
" lightline 配置
""""""""""""""""""""""""""""""

" let g:lightline = { 'colorscheme': 'PaperColor_light' }
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'Files' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" set laststatus=2


""""""""""""""""""""""""""""""
" CtrlP 配置
""""""""""""""""""""""""""""""

if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth=40
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.swp'' --ignore ''tmp'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

""""""""""""""""""""""""""""""
" vim-indent-guides 配置
""""""""""""""""""""""""""""""
" let g:indent_guides_guide_size = 2
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" 去掉菜单栏和工具栏
set guioptions-=m
set guioptions-=T

" 去掉左边滚动条和右边滚动条
set guioptions-=r
set guioptions-=L

" 高亮当前行
set cursorline

set expandtab
set softtabstop=2
set shiftwidth=2
set showmatch
set incsearch

set winaltkeys=no

filetype plugin on


au BufRead,BufNewFile *.jbuilder set ft=ruby syn=ruby

map <C-c> "+y
imap <C-v> <Esc>"+gpa
map <C-v> "+gp

map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>a

" map <D-s> :w<kEnter>
" imap <D-s> <Esc>:w<kEnter>i

map <C-A> <Home>
imap <C-A> <Home>
map <C-E> <End>
imap <C-E> <End>

" nmap <A-1> :bp<CR>
" imap <A-1> <Esc>:bp<CR>
" nmap <A-2> :bn<CR>
" imap <A-2> <Esc>:bn<CR>

map <F4> <Esc>:A<CR><Esc>
vmap <S-Tab> <Lt>gv
vmap <Tab> >gv

" 默认关闭markdown插件的folding
let g:vim_markdown_folding_disabled=1

" ag always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"

" neovim terminal 切换模式的热键
tnoremap <Leader>e <C-\><C-n>


" CTRL-Tab is next tab
noremap <C-l> :<C-U>tabnext<CR>
inoremap <C-l> <C-\><C-N>:tabnext<CR>
cnoremap <C-l> <C-C>:tabnext<CR>

" CTRL-SHIFT-Tab is previous tab
noremap <C-k> :<C-U>tabprevious<CR>
inoremap <C-k> <C-\><C-N>:tabprevious<CR>
cnoremap <C-k> <C-C>:tabprevious<CR>

noremap  <F3> :set invnumber<CR>
inoremap <F3> <esc>:set invnumber<CR>


function! s:RubyHashSyntaxToggle() range
  if join(getline(a:firstline, a:lastline)) =~# '=>'
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs:\([^: ]\+\)\s*=>/\1:/g'
  else
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs\([^: ]\+\):/:\1 =>/g'
  endif
endfunction
command! -bar -range RubyHashSyntaxToggle <line1>,<line2>call s:RubyHashSyntaxToggle()
noremap <Leader>rh :RubyHashSyntaxToggle<CR>


"========================================================================================
" ctags && taglist
"========================================================================================
" 自动切换目录
set autochdir
set tags=tags;

" taglist
" \tl                 打开Taglist/TxtBrowser窗口，在右侧栏显示
nmap <leader>tl :Tlist<CR><c-l>
" :Tlist              调用TagList
let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window     = 1             " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
"========================================================================================

"========================================================================================
" keyboard map
"========================================================================================
" 映射全选 ctrl+a
map <C-A> ggVG
map <C-A> <Esc> ggVG
"map <F12> gg=G "自动缩进

" 选中状态下 ctrl+c 复制到全局剪切板
vmap <C-c> "+y

" 选中状态下 ctrl+x 剪切到全局剪切板
vmap <C-x> "+x

" ctrl+v 从全局剪切板粘贴
map <C-v> "+gP
imap <C-v> <Esc><C-v>a
"inoremap <c-v> <esc>a<space><esc>:set paste<cr>mui<C-R>+<esc>mv’uV’v=:set nopaste<cr>

" F12 自动缩进
"map <F12> gg=G "自动缩进 
"========================================================================================
"

"=========================================================================================
" youcompleteme
"=========================================================================================
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu	

"options 

let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_auto_trigger = 1 " 自动开启标识符补全和语义补全

let g:ycm_show_diagnostics_ui = 1 " 打开YCM诊断提示特性
		
let g:ycm_error_symbol = '!'   " error 提示
let g:ycm_waring_symbol = '>'  " warning 提示

let g:ycm_enable_diagnostic_signs = 1 " 允许在vim的左边框使用提示
let g:ycm_enable_diagnostic_highlighting = 1 
let g:ycm_echo_current_diagnostic = 1 "游标处的提示

let g:ycm_always_populate_location_list = 1 " VIM的位置列表中的诊断信息，默认关闭
let g:ycm_open_loclist_on_ycm_diags = 1 " :YcmDiags 命令自动开打位置列表

let g:ycm_complete_in_comments = 1 " 允许内部注释的补全
let g:ycm_complete_in_strings = 1  " 允许字符串补全，例如文件名
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 允许将注释和字符串的内容加入到补全列表中

let g:ycm_collect_identifiers_from_tags_files = 1 " 允许从tags文件中搜集补全标识符，仅支持Exnberant Ctags格式

let g:ycm_seed_identifiers_with_syntax = 1 " 用文件类型对应的编程语言的关键字初始化补全数据库

let g:ycm_add_preview_to_completeopt = 0 " 将预览字符串加入到Vim的completeopt中

let g:ycm_autoclose_preview_window_after_completion = 0  " 接受补全提示字符串后关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1   " 离开插入模式后关闭预览窗口

let g:ycm_max_diagnostics_to_display = 30  " 显示诊断信息的最大数目

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

let g:ycm_key_invoke_completion = '<S-Space>' " 自动触发补全

let g:ycm_key_detailed_diagnostics = '<leader>d' " 游标处显示详细的诊断信息

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项


" 触发语义补全的选项
let g:ycm_semantic_triggers = {
	\     'c' : ['->', '.', ' ', '(', '[', '&'],
	\     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
	\     'perl' : ['->', '::'],
	\     'php' : ['->', '::', '.'],
	\     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
	\     'ruby' : ['.', '::'],
	\     'lua' : ['.', ':']
	\ }

let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项

" debug
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'


" 定义跳转
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR> " 跳转到声明
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>go :YcmCompleter GoTo<CR>  "跳转到定义出，否则跳转到声明处
nnoremap <leader>gt :YcmCompleter GetType<CR> "获取游标处对象的类型
nnoremap <leader>gp :YcmCompleter GetParent<CR> "获取游标处对象的作用域
"=========================================================================================

"========================================================================================
" keyboard map
"========================================================================================
" 映射全选 ctrl+a
map <C-A> ggVG
map <C-u> :Ag<space>
map <C-A> <Esc> ggVG
"映射新建tab
nnoremap <C-n> :tabnew <Enter>
"映射缓冲区tab
inoremap <C-n> <ESC> :tab split <Enter>
"map <F12> gg=G "自动缩进

" 选中状态下 ctrl+c 复制到全局剪切板
vmap <C-c> "+y

" 选中状态下 ctrl+x 剪切到全局剪切板
vmap <C-x> "+x

" ctrl+v 从全局剪切板粘贴
map <C-v> "+gP
imap <C-v> <Esc><C-v>a
"inoremap <c-v> <esc>a<space><esc>:set paste<cr>mui<C-R>+<esc>mv’uV’v=:set nopaste<cr>
" F12 自动缩进
"map <F12> gg=G "自动缩进 
"========================================================================================
"所有标签页共享一个tree
"autocmd BufEnter * NERDTreeMirror



