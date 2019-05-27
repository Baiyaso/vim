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

set t_Co=256    "����256ɫ

set nocompatible              "�ر�vi����  
set incsearch	"�������ʹ Vim ���������ַ����Ĺ����о���ʾƥ��㡣
		"��������ܿ��Լ���Ƿ�ᱻ�ҵ���ȷ��ƥ�䣬��ʱ���� <Enter> �Ϳ��������������Ǹ��ط���
		"���򣬼������������ַ������޸�Ҫ���ҵ��ַ�����
 set autoindent	"��ʹ Vim ������һ�����е�ʱ��ʹ����ǰһ��һ��������������˵������ǰ�����ͬ����Ŀհ��ַ���
		"����������ָ�� <Enter> ���У�����ͨģʽ��ִ�� "o" ����������

set lines=22 columns=95	"
set guifont=Consolas:h20	"
set winaltkeys=no
set number		"	
syntax on			"
filetype plugin indent on	"
set mouse=a
set showcmd		"
set ruler
set cmdheight=1
set showmatch		"

set  cindent shiftwidth=4	"cindentΪC���Ե��������ã�ͨ�� 'shiftwidth' ѡ������ָ����һ���������ո�����4 ���ո��Ч���ܺá�
"set cinoptions+={0
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
set smartindent "C���Ե���������
set tabstop=4	" Tab���Ŀ��
"set shiftwidth=4   "����>> << ==ʱ�����ֵ��ַ���
set expandtab   "�ÿո����Tab

"set noexpandtab	" ��Ҫ�ÿո�����Ʊ��
"set softtabstop=2	"tapתΪ���ٸ��ո� 

set backspace=2	"�˸������ģʽ	"
set backspace=eol,start,indent  "��ɾ������һ��
"set whichwrap+=<,>,h,l	"����backspace�͹�����Խ�б߽�
set nowrap  "�ر��Զ�����

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O	"���л�����{���ã��Զ���ȫ����������������д������ʱ��������ʱ���ر����á�

"set nobackup
"set noundofile
set nobackup    "ȡ������
set backupdir=$Vim\backup   "�����ļ�������
set undodir=$Vim\backup

set guioptions-=T

set encoding=utf-8
set fileencoding=utf-8  "ԭ���õ���encoding=utf-8,�˵����������,encoding��vim�ڲ��õı��뷽ʽ,�±����µĽ������


"set gfw=����
set guioptions-=m 
set guioptions-=r "���ع�����

"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8


set cursorline	"������ʾ��ǰ��
"set cursorcolumn	"��
"colorscheme zellner
colorscheme  molokai
"set fileencoding=utf-8,gbk
"set langmenu=zh_CN.ansi 
"set fileencodings=utf-8,gb2312,gbk,gb18030
"set softtabstop=4 " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
"
"set background=dark
set wildmenu
set wildmode=longest:list,full  "����ģʽtap�Զ���ȫ


call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'bling/vim-airline'
call plug#end()

