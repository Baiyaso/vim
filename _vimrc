"vim+latex:
"要有Latex工具,现在用的是miktex,要安装完整使latexmk能正常运行,vimtex需要用latexmk编译
"要装perl,latex好像要用
"python2.7 or py3,那个ultisnips要用
"要从网上下一个plug.vim插件管理器放到autoload目录里
"用这个插件管理器,该文件下边有配置的命令,然后打开vim,输入PlugInstall就会安装,安装目录在用户目录的.vim文件夹下
"用这个插件管理器安装下面的三个插件
"安装mupdf或vimtex安装目录下的readme里能直接支持的pdf阅读器,下边命令里可以改,要用小写字母
"直接输入\ll启动vimtex的编译,再输入关闭编译,保存后,在pdf阅读器里按r刷新
"现在用的这个主题,要下载,并放入colors文件夹内
"安装ultisnips使用不仅要用python还要有vim-snippets库,下边有一个这样的库,也要用PlugInstall安装
"下边用vim-plug安装的都在~/.vim/下,vim-snippets里有一个Ultisnips文件夹,里边有snippet文件
"vim-snippets里的文件别改,会出问题,在ultisnips文件夹里建立一个Ultisnips文件夹,把vim-snippets里的文件复制过去(后来发现别复制过去，会导致重复定义而还要在用的时候做出选择，添加新的再创建)再修改
"latex实时预览要求有vim自动保存,latexmk的连续编译,pdf阅读器自动刷新
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"这里有个 Vim 的扩展（不是插件），首先在https://github.com/xqin/gvimfullscreen下载一个dll，
"然后将这个 dll 文件扔到 gvim.exe 所在的目录（也就是安装目录）。
"然后通过 gVim 内置的命令调用这个 dll 中的接口，就可以达到窗口最大化了
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
"这里通过映射把命令映射到F11上


set t_Co=256    "开启256色

set nocompatible              "关闭vi兼容  
set incsearch	"这个命令使 Vim 在你输入字符串的过程中就显示匹配点。
		"用这个功能可以检查是否会被找到正确的匹配，这时输入 <Enter> 就可以真正地跳到那个地方。
		"否则，继续输入更多的字符可以修改要查找的字符串。
 set autoindent	"这使 Vim 在启动一个新行的时候使用与前一行一样的缩进。就是说，新行前面会有同样多的空白字符。
		"启动新行是指用 <Enter> 换行，在普通模式下执行 "o" 命令等情况。

set lines=22 columns=95	"
set guifont=Consolas\ for\ Powerline\ FixedD:h21	"
set guifontwide=Courier_Std:h20    "这样分别设置中英文字体,windows下不能用非等宽字体，要用还要重新编译vim,这里用注册表法,改了systemlink中Consolas（又改成了Courier Std）的字体,加入了msys使其有不一样的中文字体
set winaltkeys=no
set number		"	
syntax on			"
filetype plugin indent on	"
set mouse=a
set showcmd		"
set ruler
set cmdheight=1
set showmatch		"

set  cindent shiftwidth=4	"cindent为C语言的缩进设置，通过 'shiftwidth' 选项，你可以指定下一级的缩进空格数。4 个空格的效果很好。
"set cinoptions+={0
"不同的人有不同的缩进风格。在默认情况下，Vim 采用了 90% 的程序员都使用的一种方
"式并能很好地完成工作。但是，如果你想使用其它的风格，你可以通过 'cinoptions' 选
"项来设定。 'cinoptions' 默认为空，Vim 会使用默认风格。你可以在你希望改变的地方添加相应
"的项目。例如，要使大括号的缩进如下所示:
  "      if (flag) 
    "      { 
      "      i = 8; 
        "    j = 0; 
          "} 
"请使用这个命令:    :set cinoptions+={2
set smartindent "C语言的缩进设置
set tabstop=4	" Tab键的宽度
"set shiftwidth=4   "按下>> << ==时所出现的字符数
set expandtab   "用空格代替Tab

"set noexpandtab	" 不要用空格代替制表符
"set softtabstop=2	"tap转为多少个空格 

set backspace=2	"退格键正常模式	"
set backspace=eol,start,indent  "能删除到上一行
"set whichwrap+=<,>,h,l	"允许backspace和光标键跨越行边界
set nowrap  "关闭自动折行

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O	"其中花括号{设置，自动补全并换行缩进，这在写函数的时候或语句块的时候特别有用。

"set nobackup
"set noundofile
set nobackup    "取消备份
set backupdir=$Vim\backup   "备份文件夹设置
set undodir=$Vim\backup

set guioptions-=T

set encoding=utf-8      "经过测试是这一条命令使命令行模式下的vim刚开始的“输入enter键继续”乱码
set fileencoding=utf-8  "原本用的是encoding=utf-8,菜单会出现乱码,encoding是vim内部用的编码方式,下边有新的解决方法


"set gfw=黑体
set guioptions-=m 
"set guioptions-=r "隐藏滚动条

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"set termencoding = cp936  
"设置中文提示
language messages zh_CN.utf-8
set ambiwidth=double    "设置双子宽显示


set cursorline	"高亮显示当前行
"set cursorcolumn	"列
"colorscheme zellner
"colorscheme  molokai
"let g:molokai_original=1
"let g:rehash256=1

colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"

"colorscheme seoul256
"let g:seoul256_background = 233
"colo seoul256

"let g:solarized_termcolors=256
"colorscheme solarized
set background=dark

"colorscheme space-vim-dark
"let g:space_vim_dark_background = 234
"color space-vim-dark

"set fileencoding=utf-8,gbk
"set langmenu=zh_CN.ansi 
"set fileencodings=utf-8,gb2312,gbk,gb18030
"set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
"
"set background=dark
set wildmenu
set wildmode=longest:list,full  "命令模式tap自动补全


"autocmd Filetype tex setl updatetime=1     "刷新tex文件，好像没啥用
"set autoread       "自动读已经被修改的文件
call plug#begin('~/.vim/plugged')
"有了plug.vim就可以用下边的Plug语句，管理插件，它实际就是把那些插件从GitHub上下到~\.vim\plugged\内，在这个文件夹里的插件文件就可以用了（有的不行，如YCM需要再进行安装），再按照插件要求进行开启，配置操作，主题把color文件加下文件复制到安装目录的color目录下，就可以使用插件了。
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='sumatrapdf'   "这样可以用一些更复杂的pdf阅读器
"let g:vimtex_view_method='mupdf'   "这个可以用一些mupdf skim Zathura
let g:vimtex_quickfix_mode=0    "这个好像是下边一行出现的连续编译开启的编译提示模式设置
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"    用不到了
"不要在vim-snippets中预备好的各语言snippets上直接修改，因为每次更新都会被覆盖。
"必须在ultisnips文件夹下创建一个UltiSnips文件夹，所有自定义代码都存在这里。
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug '907th/vim-auto-save'
let g:auto_save = 0 "还是把他关了吧，等到写Latex用的时候再开启
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]
Plug 'plasticboy/vim-markdown'
Plug 'morhetz/gruvbox'  "发现gruvbox等主题必须要把color文件夹的文件放到vim安装目录的color文件夹，才能启用这个主题
"Plug 'junegunn/seoul256.vim'
"Plug 'liuchengxu/eleline.vim'
Plug 'vim-airline/vim-airline-themes'
"let g:airline_powerline_fonts=1 
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

set laststatus=2    "持续显示
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1  
let g:airline_powerline_fonts = 1   
"设置了好长时间终于是成功设置了airline，
"我明白了插件目录的那些插件文件夹中的autoload都是会自动加载的
"我还下载了一个airline-theme插件，里面有很多airline的插件,那个gruvbox中的airline主题也能用
"airline有个问题就是，他有些字符一般字体无法用，还要下载几个字体安装，上网搜索吧
"安装完后要用上边的一个指令开启，还要用下边的指令调用那些字符使airline正常显示
"还要用上边的set guifont设置字体，看不太懂，set guifont=Consolas_for_Powerline不行
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
"设置切换Buffer快捷键"
 nnoremap <C-tab> :bn<CR>
 nnoremap <C-s-tab> :bp<CR>
call plug#end()
