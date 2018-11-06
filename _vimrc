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

set nocompatible              "�ر�vi����  
set incsearch	"�������ʹ Vim ���������ַ����Ĺ����о���ʾƥ��㡣
		"��������ܿ��Լ���Ƿ�ᱻ�ҵ���ȷ��ƥ�䣬��ʱ���� <Enter> �Ϳ��������������Ǹ��ط���
		"���򣬼������������ַ������޸�Ҫ���ҵ��ַ�����
 set autoindent	"��ʹ Vim ������һ�����е�ʱ��ʹ����ǰһ��һ��������������˵������ǰ�����ͬ����Ŀհ��ַ���
		"����������ָ�� <Enter> ���У�����ͨģʽ��ִ�� "o" ����������

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

set cindent shiftwidth=4	"ͨ�� 'shiftwidth' ѡ������ָ����һ���������ո�����4 ���ո��Ч���ܺá�
set cinoptions+={2
"��ͬ�����в�ͬ�����������Ĭ������£�Vim ������ 90% �ĳ���Ա��ʹ�õ�һ�ַ�
"ʽ���ܺܺõ���ɹ��������ǣ��������ʹ�������ķ�������ͨ�� 'cinoptions' ѡ
"�����趨�� 'cinoptions' Ĭ��Ϊ�գ�Vim ��ʹ��Ĭ�Ϸ�����������ϣ���ı�ĵط������Ӧ
"����Ŀ�����磬Ҫʹ�����ŵ�����������ʾ:
  "      if (flag) 
    "      { 
      "      i = 8; 
        "    j = 0; 
          "} 
"��ʹ���������:    :set cinoptions+={2
"set smartindent
"set tabstop=4	" Tab���Ŀ��
"set shiftwidth=4
"set expandtab

"set noexpandtab	" ��Ҫ�ÿո�����Ʊ��
"set softtabstop=2	" ͳһ����Ϊ4

set backspace=2	"�˸������ģʽ	"
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l	"����backspace�͹�����Խ�б߽�

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O	"���л�����{���ã��Զ���ȫ����������������д������ʱ��������ʱ���ر����á�

"set nobackup
"set noundofile
set backupdir=$Vim\backup
set undodir=$Vim\backup

set guioptions-=T


set encoding=utf-8
set guioptions-=m 

set cursorline	"������ʾ��ǰ��
"set cursorcolumn	"��
colorscheme zellner
