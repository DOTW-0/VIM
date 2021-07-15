"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
"set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" vim-plug
call plug#begin('/home/admin/.config/nvim/plugged')
	"=== 显示文件函数
	Plug 'majutsushi/tagbar'
	"=== 可视化缩进
	Plug 'Yggdroot/indentLine'
	"=== 主题
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"=== 配色
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	"=== 文件管理器
	Plug 'preservim/nerdtree'
	"=== markdown预览
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
	"=== 代码补全
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	"=== 颜色显示
	Plug 'norcalli/nvim-colorizer.lua'
	"=== nvim中使用sudo
	Plug 'lambdalisue/suda.vim'
	"=== 括号补全
	Plug 'jiangmiao/auto-pairs'
	"=== 注释反注释
	Plug 'preservim/nerdcommenter'
	"=== 悬浮终端
	Plug 'voldikss/vim-floaterm'
	"=== 括号高亮
	Plug 'luochen1990/rainbow'
    "=== 多行光标
    Plug 'terryma/vim-multiple-cursors'
    call plug#end()

"== vim-airline
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:bubblegum_airline = 1
let g:airline_theme='bubblegum'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
"== powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.crypt = "CR"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.whitespace = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
"=== 切换tab的快捷键
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"=== 切换到前一个tab
nmap <leader>- <Plug>AirlineSelectPrevTab
"=== 切换到后一个tab
nmap <leader>+ <Plug>AirlineSelectNextTab
"=== 删除当前tab
nmap <leader>q :bp<cr>:bd #<cr>


"== NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"== 配色
let g:material_theme_style = 'darker'
colorscheme material

" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-cmake',
	\ 'coc-clangd',
	\ 'coc-git',
	\ 'coc-vimlsp',
	\ 'coc-sh',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-html',
	\ 'coc-highlight',
	\ 'coc-pyright',
	\ 'coc-json',
    \ 'coc-tsserver']

"== floaterm
nnoremap <leader>tc :FloatermNew --autoclose=0 gcc % -o %< && ./%<<CR>
let g:floaterm_keymap_kill   = '<F4>'
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

"== nerdcommenter
"== 默认情况下在注释定界符后添加空格
let g:NERDSpaceDelims = 1
"== python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
"== 对紧凑的多行注释使用紧凑语法
let g:NERDCompactSexyComs = 1
"== 添加您自己的自定义格式或覆盖默认值
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
"== 允许注释和倒空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1
"== 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1
"== 启用NERDCommenterToggle以检查所有选定的行是否已注释
let g:NERDToggleCheckAllLines = 1

"== rainbow
let g:rainbow_active = 1

"== tagbar
let g:tagbar_width=30
nnoremap <silent> <F8> :TagbarToggle<CR>

"== vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
