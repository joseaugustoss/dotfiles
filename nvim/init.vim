call plug#begin()
Plug 'Mofiqul/dracula.nvim'
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on              " Enable syntax highlight (Habilita destaque de sintaxe)
set nu                 " Enable line numbers (Habilita numeração de linhas)
set tabstop=4          " Show existing tab with 4 spaces width (Mostra tabs existentes com 4 espaços de largura)
set softtabstop=4      " Show existing tab with 4 spaces width (Mostra tabs existentes com 4 espaços de largura)
set shiftwidth=4       " When indenting with '>', use 4 spaces width (Ao indentar com '>', usa 4 espaços de largura)
set expandtab          " On pressing tab, insert 4 spaces (Ao pressionar tab, insere 4 espaços)
set smarttab           " insert tabs on the start of a line according to shiftwidth (Insere tabs no início de uma linha de acordo com o 'shiftwidth')
set smartindent        " Automatically inserts one extra level of indentation in some cases (Automaticamente insere um nível extra de indentação em alguns casos)
set hidden             " Hides the current buffer when a new file is openned (Esconde o buffer atual quando um novo arquivo é aberto)
set incsearch          " Incremental search (Busca incremental)
set ignorecase         " Ignore case in search (Ignora maiúsculas/minúsculas na busca)
set smartcase          " Consider case if there is a upper case character (Considera maiúsculas/minúsculas se houver um caractere em maiúsculas)
set scrolloff=8        " Minimum number of lines to keep above and below the cursor (Número mínimo de linhas a manter acima e abaixo do cursor)
set colorcolumn=100    " Draws a line at the given line to keep aware of the line size (Desenha uma linha na coluna dada para manter a atenção ao tamanho da linha)
set signcolumn=yes     " Add a column on the left. Useful for linting (Adiciona uma coluna à esquerda. Útil para 'linting')
set cmdheight=2        " Give more space for displaying messages (Dá mais espaço para exibir mensagens)
set updatetime=100     " Time in miliseconds to consider the changes (Tempo em milissegundos para considerar as mudanças)
set encoding=utf-8     " The encoding should be utf-8 to activate the font icons (A codificação deve ser utf-8 para ativar os ícones de fonte)
set nobackup           " No backup files (Sem arquivos de backup)
set nowritebackup      " No backup files (Sem arquivos de backup)
set splitright         " Create the vertical splits to the right (Cria as divisões verticais à direita)
set splitbelow         " Create the horizontal splits below (Cria as divisões horizontais abaixo)
set autoread           " Update vim after file update from outside (Atualiza o Vim após a atualização de um arquivo por um processo externo)
set mouse=a            " Enable mouse support (Habilita suporte ao mouse)
filetype on            " Detect and set the filetype option and trigger the FileType Event (Detecta e define a opção 'filetype' e aciona o evento 'FileType')
filetype plugin on     " Load the plugin file for the file type, if any (Carrega o arquivo de plugin para o tipo de arquivo, se houver)
filetype indent on     " Load the indent file for the file type, if any (Carrega o arquivo de indentação para o tipo de arquivo, se houver)



" Themes """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif

let g:airline_theme = 'sonokai'

" Remaps """"""""""
" remaps aqui



" autocmd """"""""""
" autocmds aqui




" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
