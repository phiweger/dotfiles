execute pathogen#infect()

" yanked text gets put into clipboard
" http://stackoverflow.com/questions/9166328/how-to-copy-selected-lines-to-clipboard-in-vim
set clipboard=unnamedplus

" A useful command to have in your .vimrc is set pastetoggle=<F10> or some other button, to easily toggle between paste and nopaste.
" stackoverflow, 2514445, turning-off-auto-indent-when-pasting-text-into-vim
set pastetoggle=<F2>

" colorscheme base16
" https://github.com/chriskempson/base16-vim
" take care to also configure the shell running vim right:
" https://github.com/chriskempson/base16-shell
" let g:base16_shell_path=base16-builder/output/shell/
" set t_Co=256
let base16colorspace=256
" set t_Co=16 " https://github.com/chriskempson/base16-vim/issues/19
set background=dark
colorscheme base16-ocean
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif



" Add the following line to your .vimrc to disable the folding configuration:
let g:vim_markdown_folding_disabled = 1

" after typing an abbreviation, vim expands it when we type < space >
set complete+=k

set dictionary+=~/.vimdict

" Fuzzy string matching with [fzf](https://github.com/junegunn/fzf)
set rtp+=~/.fzf


" Convert a tab into 4 spaces.
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" supertab
" don't expand at the beginning of a line
" let g:SuperTabNoCompleteAfter = ['^', '\s']
" this disables the dictionary autocompletion
" to insert a literal tab use <C-Tab> 
" see also: help supertab-mappingtabliteral

" Remove backward compatibility with vi
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set nocompatible 
" some more
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber 
" changes Vim’s line number column to display how far away each line is from 
" the current one, instead of showing the absolute line number
set undofile

" remap leader key
let mapleader = ","

" fix Vim’s horribly broken default regex “handling”
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
" Both commands together make Vim deal with case-sensitive search intelligently. 
" If you search for an all-lowercase string your search will be case-
" insensitive, but if one or more characters is uppercase the search will be 
" case-sensitive.

set gdefault
" applies substitutions globally on lines

set incsearch
set showmatch
set hlsearch
" work together to highlight search results (as you type)

nnoremap <leader><space> :noh<cr>
" makes it easy to clear out a search by typing ,<space>
" this means to cancel the highlighted text after we our done searchingw

nnoremap <tab> %
vnoremap <tab> %
" make the tab key match bracket pairs

" manage my line wrapping settings and also show a colored column at 85
" characters
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85




" New Vim users will want the following lines to teach them to do things right.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


set list
set listchars=tab:▸\ ,eol:¬
" show invisible characters with the same characters that TextMate uses

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ack
nnoremap <leader>a :Ack

" open up my ~/.vimrc file in a vertically split window so I can add new 
" things to it on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" use 2*j to enter normal mode
inoremap jj <Esc>

" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l
" move around windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" " tab does no expansion at the beginning of a line
" " http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
" function! Smart_TabComplete()
"   let line = getline('.')                         " current line

"   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                   " line to one character right
"                                                   " of the cursor
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\<tab>"
"   endif
"   let has_period = match(substr, '\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\<C-X>\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\<C-X>\<C-F>"                         " file matching
"   else
"     return "\<C-X>\<C-O>"                         " plugin matching
"   endif
" endfunction

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>


" quick access NERDTree
nnoremap <leader>n :NERDTree

" vim as a Python IDE

" Sample .vimrc file by Martin Brochhaus
"
" Presented at PyCon APAC 2012


" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

" set pastetoggle=<F2>
" set clipboard=unnamed


" Mouse and backspace
" set mouse=a  " on OSX press ALT and click
" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
" let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>


" Quicksave command
" noremap <C-Z> :update<CR>
" vnoremap <C-Z> <C-C>:update<CR>
" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
" noremap <Leader>e :quit<CR>  " Quit current window
" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h


" easier moving between tabs
" map <Leader>n <esc>:tabprevious<CR>
" map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
"" filetype off
"" filetype plugin indent on
"" syntax on


" Showing line numbers and length
"" set number  " show line numbers
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Real programmers don't use TABs but spaces
"" set tabstop=4
"" set softtabstop=4
"" set shiftwidth=4
"" set shiftround
"" set expandtab


" Make search case insensitive
"" set hlsearch
"" set incsearch
"" set ignorecase
"" set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable


