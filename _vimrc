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

set nocompatible              "关闭vi兼容  
set incsearch	"这个命令使 Vim 在你输入字符串的过程中就显示匹配点。
		"用这个功能可以检查是否会被找到正确的匹配，这时输入 <Enter> 就可以真正地跳到那个地方。
		"否则，继续输入更多的字符可以修改要查找的字符串。
 set autoindent	"这使 Vim 在启动一个新行的时候使用与前一行一样的缩进。就是说，新行前面会有同样多的空白字符。
		"启动新行是指用 <Enter> 换行，在普通模式下执行 "o" 命令等情况。

set lines=40 columns=165	"
set guifont=Ubuntu_Mono:h22	"
set winaltkeys=no
set number		"	
syntax on			"
filetype plugin indent on	"
set mouse=a
set showcmd		"
set ruler
set cmdheight=2
set showmatch		"

set cindent shiftwidth=4	"通过 'shiftwidth' 选项，你可以指定下一级的缩进空格数。4 个空格的效果很好。
set cinoptions+={2
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
"set smartindent
"set tabstop=4	" Tab键的宽度
"set shiftwidth=4
"set expandtab

"set noexpandtab	" 不要用空格代替制表符
"set softtabstop=2	" 统一缩进为4

set backspace=2	"退格键正常模式	"
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l	"允许backspace和光标键跨越行边界

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O	"其中花括号{设置，自动补全并换行缩进，这在写函数的时候或语句块的时候特别有用。

"set nobackup
"set noundofile
set backupdir=$Vim\backup
set undodir=$Vim\backup

set guioptions-=T


set encoding=utf-8
set guioptions-=m 

set cursorline	"高亮显示当前行
"set cursorcolumn	"列
colorscheme zellner
