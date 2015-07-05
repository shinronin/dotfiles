set shell=/bin/sh

" Theme
let &t_Co=256       " 256 colors
color molokai       " https://github.com/tomasr/molokai
set nu              " Show line numbers
set guioptions-=L   " Hide left scrollbar
set guioptions-=r   " Hide right scrollbar
set guioptions-=T   " Hide toolbar


" Misc
set nobackup    " Don't create backup files
set noswapfile  " Don't create swap files
set nowrap
set nowritebackup


" Tabs and spaces
set list
set listchars=tab:»-,trail:~,extends:»,precedes:«
hi NonText ctermfg=0 guifg=black
au BufNewFile,BufRead *.es6 set filetype=javascript
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype conf setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype scala setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.rabl set filetype=ruby
autocmd BufNewFile,BufRead Gruntfile set filetype=javascript
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead Puppetfile set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead Podfile set filetype=ruby
au BufRead,BufNewFile ~/Documents/Coding/gt-ui/* setl et sw=4 ts=4
au BufRead,BufNewFile ~/Documents/Coding/ember-i18n/* setl et sw=4 ts=4
au BufRead,BufNewFile ~/Documents/Coding/gt-api-docs-ui/* setl et sw=4 ts=4
au BufRead,BufNewFile ~/Documents/Coding/Indium/* setl noet

if exists('+colorcolumn')
	set colorcolumn=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Font
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h24 " Not a system font. Will have to install from https://github.com/Lokaltog/powerline-fonts
set linespace=2


" Mappings
let mapleader = ","
nmap <C-n> :NERDTreeTabsToggle<CR>
nmap <C-t> :TagbarToggle<CR>


" Ctrlp
" https://github.com/kien/ctrlp.vim
let g:ctrlp_working_path_mode = 0 " Turn off automatically finding a directory to search in. This allows a .ctrlp file to tell where to start the search
let g:ctrlp_custom_ignore = '\v[\/](doc|cordova|bower_components|node_modules|tmp|log|target|dist)|(\.(swp|ico|git|svn))$'


" NERDTree
" https://github.com/scrooloose/nerdtree
let NERDTreeShowHidden=1            " Always show hidden files/dirs in nerdtree
let g:ctrlp_dont_split='nerdtree'   " Don't open a file from nerdtree in a split pane
let g:NERDTreeWinSize=20            " Make the side nav a little smaller

" Tagbar
" https://github.com/majutsushi/tagbar
let g:tagbar_width = 30


" Indent guides settings. Toggle with leader + ig
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0 " Use below colors instead
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white ctermbg=255
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=white ctermbg=255


" Settings for Airline (statusbar at the bottom)
" https://github.com/bling/vim-airline
"
" Make sure non-ascii font in iterm is set to droid sans mono for powerline
" too!
let g:airline_powerline_fonts = 1   " Uses patched fonts so it's beautiful
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='powerlineish'  " Set theme
set laststatus=2                    " Always show the status bar


" PATHOGEN
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
filetype plugin indent on
syntax on
