" config
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed		
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=4
set relativenumber

call plug#begin('~/AppData/Local/nvim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Rich presence Discord
Plug 'andweeb/presence.nvim'

"themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'scrooloose/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" autocomplete
"Plug 'sirver/ultisnips'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"IDE
Plug 'junegunn/fzf'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" themes-config
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode
let NERDTreeQuitOnOpen=1

" maps
let mapleader = " "

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" quick semi
nnoremap <Leader>; $a;<Esc>

" shorter commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" plugs
nnoremap <Leader>nt :NERDTreeFind<CR>

" remap key for coc
nnoremap <Leader>gd <Plug>(coc-definition)

" startup node file
nnoremap <Leader>x :!node %<cr>

set splitright
function! OpenTerminal()
	" move to right most buffer
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"

	let bufNum = bufnr("%")
	let bufType = getbufvar(bufNum, "&buftype", "not found")

	if bufType == "terminal"
		" close existing terminal
		execute "q"
	else
		" open terminal
		execute "vps term://shell"

		" turn off numbers
		execute "set nonu"
		execute "set nornu"

		" toggle insert on enter/exit
		silent au BufLeave <buffer> stopinsert!
		silent au BufWinEnter,WinEnter <buffer> startinsert!

		" set maps inside terminal buffer
		execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
		execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
		execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

		startinsert!
	endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

" variables Rich Presence Discord
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_log_level
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"
