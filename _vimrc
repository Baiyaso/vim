"vim+latex:
"Ҫ��Latex����,�����õ���miktex,Ҫ��װ����ʹlatexmk����������,vimtex��Ҫ��latexmk����
"Ҫװperl,latex����Ҫ��
"python2.7 or py3,�Ǹ�ultisnipsҪ��
"Ҫ��������һ��plug.vim����������ŵ�autoloadĿ¼��
"��������������,���ļ��±������õ�����,Ȼ���vim,����PlugInstall�ͻᰲװ,��װĿ¼���û�Ŀ¼��.vim�ļ�����
"����������������װ������������
"��װmupdf��vimtex��װĿ¼�µ�readme����ֱ��֧�ֵ�pdf�Ķ���,�±���������Ը�,Ҫ��Сд��ĸ
"ֱ������\ll����vimtex�ı���,������رձ���,�����,��pdf�Ķ����ﰴrˢ��
"�����õ��������,Ҫ����,������colors�ļ�����
"��װultisnipsʹ�ò���Ҫ��python��Ҫ��vim-snippets��,�±���һ�������Ŀ�,ҲҪ��PlugInstall��װ
"�±���vim-plug��װ�Ķ���~/.vim/��,vim-snippets����һ��Ultisnips�ļ���,�����snippet�ļ�
"vim-snippets����ļ����,�������,��ultisnips�ļ����ｨ��һ��Ultisnips�ļ���,��vim-snippets����ļ����ƹ�ȥ���޸�
"latexʵʱԤ��Ҫ����vim�Զ�����,latexmk����������,pdf�Ķ����Զ�ˢ��
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
set guifont=Consolas:h21	"
set guifontwide=Consolas:h18    "�����ֱ�������Ӣ������,windows�²����÷ǵȿ����壬Ҫ�û�Ҫ���±���vim,������ע���,����systemlink��Consolas������,������msysʹ���в�һ������������
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
"set guioptions-=r "���ع�����

"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8


set cursorline	"������ʾ��ǰ��
"set cursorcolumn	"��
"colorscheme zellner
"colorscheme  molokai
"let g:molokai_original=1
"let g:rehash256=1

let g:solarized_termcolors=256
colorscheme solarized
set background=dark

"colorscheme space-vim-dark
"let g:space_vim_dark_background = 234
"color space-vim-dark

"set fileencoding=utf-8,gbk
"set langmenu=zh_CN.ansi 
"set fileencodings=utf-8,gb2312,gbk,gb18030
"set softtabstop=4 " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
"
"set background=dark
set wildmenu
set wildmode=longest:list,full  "����ģʽtap�Զ���ȫ


"autocmd Filetype tex setl updatetime=1     "ˢ��tex�ļ�������ûɶ��
"set autoread       "�Զ����Ѿ����޸ĵ��ļ�
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='sumatrapdf'   "����������һЩ�����ӵ�pdf�Ķ���
"let g:vimtex_view_method='mupdf'   "���������һЩmupdf skim Zathura
let g:vimtex_quickfix_mode=0    "����������±�һ�г��ֵ��������뿪���ı�����ʾģʽ����
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
"let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"    �ò�����
"��Ҫ��vim-snippets��Ԥ���õĸ�����snippets��ֱ���޸ģ���Ϊÿ�θ��¶��ᱻ���ǡ�
"������ultisnips�ļ����´���һ��UltiSnips�ļ��У������Զ�����붼�������
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]
Plug 'plasticboy/vim-markdown'
call plug#end()
