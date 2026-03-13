" ========================================
" Базовые настройки
" ========================================
set nocompatible                " Отключаем совместимость с Vi
filetype plugin on              " Включаем определение типов файлов
syntax on                       " Включаем подсветку синтаксиса
set number                      " Показывать номера строк
set relativenumber              " Относительные номера строк
set cursorline                  " Подсвечивать текущую строку
set wildmenu                    " Улучшенное меню автодополнения
set showcmd                     " Показывать введённые команды
set showmode                    " Показывать текущий режим
set mouse=a
" ========================================
" Отступы и форматирование
" ========================================
set expandtab                   " Табы пробелами
set tabstop=4                   " Ширина таба 4 пробела
set shiftwidth=4                " Ширина отступа 4 пробела
set softtabstop=4               " Удалять 4 пробела как таб
set autoindent                  " Автоотступ
set smartindent                 " Умные отступы
set wrap                        " Перенос строк

" ========================================
" Поиск
" ========================================
set hlsearch                    " Подсветка результатов поиска
set incsearch                   " Инкрементальный поиск
set ignorecase                  " Игнорировать регистр
set smartcase                   " Кроме случаев с заглавными
nohlsearch                      " Сбросить подсветку при старте

" ========================================
" Плагины (vim-plug)
" ========================================
call plug#begin('~/.vim/plugged')

" YouCompleteMe - автодополнение
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

" NERDTree - файловый менеджер
Plug 'preservim/nerdtree'

" Airline - красивая строка статуса
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Surround - работа с окружением (кавычки, скобки)
Plug 'tpope/vim-surround'

" Commentary - комментирование (gc)
Plug 'tpope/vim-commentary'

" Fugitive - интеграция с Git
Plug 'tpope/vim-fugitive'

" EditorConfig - поддержка .editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" ========================================
" ОСНОВНЫЕ НАСТРОЙКИ - СТАВЬ СЮДА
" ========================================

" --- Буфер обмена (СТАВЬ ЭТОТ БЛОК СЮДА) ---
set clipboard=unnamedplus

" Копирование в системный буфер
vnoremap <C-c> "+y
vnoremap <C-Insert> "+y

" Вставка из системного буфера
inoremap <C-v> <C-r>+
nnoremap <C-v> "+gP
cnoremap <C-v> <C-r>+

" Вырезание
vnoremap <C-x> "+x


" ========================================
" Приветственная страница
" ========================================
" При запуске без файла открываем стартовую страницу
autocmd VimEnter * if argc() == 0 | e ~/.vim/config/startpage.txt | setlocal nomodifiable nomodified | endif

" По F1 открываем стартовую страницу (в новой вкладке)
nnoremap <F1> :tabnew ~/.vim/config/startpage.txt<CR>:setlocal nomodifiable nomodified<CR>

" Или если хочешь в текущем окне:
" nnoremap <F1> :e ~/.vim/config/startpage.txt<CR>:setlocal nomodifiable nomodified<CR>

" ========================================
" Настройки YouCompleteMe
" ========================================
let g:ycm_confirm_extra_conf = 0                " Не спрашивать про .ycm_extra_conf.py
let g:ycm_autoclose_preview_window_after_completion = 1  " Закрывать окно после выбора
let g:ycm_min_num_of_chars_for_completion = 2   " Начинать подсказки после 2 символов
let g:ycm_enable_diagnostic_highlighting = 0    " Отключить подсветку ошибок
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  " Путь к конфигу
let g:ycm_python_binary_path = '/usr/bin/python3'  " Путь к Python 3

" Настройки меню автодополнения
set completeopt=menu,menuone,noselect,preview
set pumheight=10                " Высота меню автодополнения

" ========================================
" Настройки Airline
" ========================================
let g:airline#extensions#tabline#enabled = 1    " Показывать буферы в tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1               " Использовать Powerline шрифты
let g:airline_theme = 'dark'                     " Тема Airline

" ========================================
" Настройки NERDTree
" ========================================
let g:NERDTreeWinSize = 30      " Ширина окна NERDTree
let g:NERDTreeShowHidden = 1    " Показывать скрытые файлы
let g:NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.git$']  " Игнорировать файлы

" ========================================
" Горячие клавиши
" ========================================
" Лидер клавиша (запятая)
let mapleader = ","

" Быстрое сохранение
nnoremap <Leader>w :w<CR>

" Быстрый выход
nnoremap <Leader>q :q<CR>

" Очистить поиск
nnoremap <Leader>h :nohlsearch<CR>

" Переключение NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Переключение номеров строк (абсолютные/относительные)
nnoremap <Leader>r :set relativenumber!<CR>

" Копировать в системный буфер
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
nnoremap <Leader>y "+y

" Вставить из системного буфера
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p

" Перемещение между окнами (Ctrl + h/j/k/l)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Увеличение/уменьшение размера окон
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>

" ========================================
" Внешний вид (без прозрачности)
" ========================================
set background=dark              " Тёмный фон
colorscheme desert               " Цветовая схема

" Прозрачность отключена (закомментирована из-за ошибок в некоторых терминалах)
" Прозрачность (работает в большинстве терминалов)
silent! highlight Normal ctermbg=none guibg=none
silent! highlight NonText ctermbg=none guibg=none

" ========================================
" Дополнительные настройки
" ========================================
set backspace=indent,eol,start   " Нормальная работа backspace
set history=1000                  " Длинная история команд
set undofile                      " Сохранять историю изменений
set undodir=~/.vim/undo            " Папка для истории
set backupdir=~/.vim/backup        " Папка для бэкапов
set directory=~/.vim/swap          " Папка для swap-файлов

" Создать папки, если их нет
silent! call mkdir(expand('~/.vim/undo'), 'p', 0700)
silent! call mkdir(expand('~/.vim/backup'), 'p', 0700)
silent! call mkdir(expand('~/.vim/swap'), 'p', 0700)

" Автоматическая перезагрузка файлов при изменении
set autoread

" Время ожидания для комбинаций клавиш
set timeoutlen=500
set ttimeoutlen=10

" ========================================
" возврат к строке
" ========================================

" Сохранять больше информации в viminfo
set viminfo='1000,<500,f1,:1000,/1000,n~/.vim/viminfo

" Возврат курсора
augroup restore_cursor
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" ========================================
" Файлы и кодировка
" ========================================
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8
set termencoding=utf-8

" ========================================
" Для конкретных типов файлов
" ========================================
" Python: 4 пробела
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" JavaScript/HTML/CSS: 2 пробела
autocmd FileType javascript,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Go: табы
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

" Makefile: табы обязательны
autocmd FileType make setlocal noexpandtab

" ========================================
" Полезные сокращения
" ========================================
" Сохранить и запустить Python скрипт
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python3 %<CR>

" Сохранить и запустить Bash скрипт
autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:!bash %<CR>

" Сохранить и скомпилировать C
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!gcc % -o %< && ./%<<CR>
