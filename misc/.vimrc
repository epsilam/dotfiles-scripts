"""""" General vim configurations
	set nocompatible
	filetype off
	syntax on
	set number
	set breakindent
	set laststatus=2
	set t_Co=256
	set wrap
	set linebreak
	set tabstop=4
	
	map <Space> <Leader>
	nnoremap <Leader>x i
	set showcmd


	set splitbelow
	set splitright

"""""" gvim options
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	if has('gui_running')
	  set guifont=Fira\ Code\ 12
	endif

"""""" Vundle configs
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin() "Plugins must be entered after this line.

	" Plugin manager
	Plugin 'VundleVim/Vundle.vim'
	
	" Various colorschemes
	Plugin 'flazz/vim-colorschemes'
	
	" Nord theme - see https://github.com/arcticicestudio/nord-vim
	Plugin 'arcticicestudio/nord-vim'
	
	" Minimalistic information bar
	Plugin 'itchyny/lightline.vim'
	
	" Git wrapper for vim
	Plugin 'tpope/vim-fugitive'
	
	" pydoc integration in vim
	Plugin 'fs111/pydoc.vim'
	
	" File management in vim
	Plugin 'scrooloose/nerdtree'
	
	" Rainbow parentheses
	Plugin 'kien/rainbow_parentheses.vim'
	
	" Vimtex
	Plugin 'lervag/vimtex'

	" Tab completion - with custom configuration below
	Plugin 'ervandew/supertab'

	" Snippets
	Plugin 'honza/vim-snippets'

	" Smart input - automatic bracket closing and escaping
	Plugin 'kana/vim-smartinput'
	
	call vundle#end() "Plugins must be entered before this line.
	filetype plugin indent on


"""""" Nord theme settings
	if (has("nvim"))
	  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
	  set termguicolors
	endif
	
	let g:nord_italic = 1
	let g:nord_comment_brightness = 16
	
	set background=dark
	colorscheme nord

"""""" Lightline settings
	let g:lightline = {
	      \ 'colorscheme': 'nord',
	      \ 'active': {
	      \   'left': [ [ 'mode', 'paste' ],
	      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	      \ },
	      \ 'component_function': {
	      \   'gitbranch': 'fugitive#head'
	      \ },
	      \ }

"""""" Rainbow parentheses settings
	let g:rbpt_max = 16
	let g:rbpt_loadcmd_toggle = 0
	let g:rbpt_colorpairs = [
	    \ ['brown',       'OliveDrab1' ],
	    \ ['Darkblue',    'khaki1'     ],
	    \ ['darkgray',    'salmon1'    ],
	    \ ['darkgreen',   'maroon'     ],
	    \ ['darkcyan',    'orchid'     ],
	    \ ['darkred',     'SteelBlue1' ],
	    \ ['darkmagenta', 'OliveDrab1' ],
	    \ ['brown',       'khaki1'     ],
	    \ ['gray',        'salmon1'    ],
	    \ ['black',       'maroon'     ],
	    \ ['darkmagenta', 'orchid'     ],
	    \ ['Darkblue',    'SteelBlue1' ],
	    \ ['darkgreen',   'OliveDrab1' ],
	    \ ['darkcyan',    'khaki1'     ],
	    \ ['darkred',     'salmon1'    ],
	    \ ['red',         'maroon'     ],
	    \ ]
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces

"""""" vimtex settings
" Here is the documentation: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
" For help with shortcuts, go to vimtex default mappings
    let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'process',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
	\}
    let g:vimtex_view_method = 'zathura'

"""""" Nerdtree settings
" Shortcut key
	nmap <leader>rr :NERDTree<cr>
