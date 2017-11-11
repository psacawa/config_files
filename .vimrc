" zestartuj pathogen
execute pathogen#infect()

" przejście z trybu edycji do normalnego bez cofania wskażnika
" zabieg działający, lecz podejrzanej wartości
" inoremap <Esc> <Esc>l

" podświetlenie syntaksu
syntax on

" włącz rozpoznanie wtyczek zależnych od rozszerzenia pliku?? (głównie merlin)
" na razie powoduje konflikty między opam merlian a command-t
filetype plugin on

" wyłączyć automatyczne komentarze
" zapomniałem co to robi
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" natychmiastowe wyszukiwanie niepłnych haseł
set incsearch

" pasek statusu
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ZEPSUTE
" automatyczna indentacja kiedy stosowany operator o
" nnoremap o :set ai<CR>o<Esc>:set ai!<CR>
set ai

" na czas gdy klawiatura będzie zepsuta
" automycznie otwórz bufora dla wpsiania komend
nnoremap : :<C-f>i

" szybsze wczytanie <Esc>?? (CHYBA NIEPOTRZEBNE)
" set esckeys
" set timeoutlen=100 ttimeoutlen=0

" numerowane linie
set number

" tabulacja
set tabstop=4
set ruler
set backspace=2
" teraz >> daje jeden indentację
set shiftwidth=0

" dezaktywować Ins i q (nagrywanie macrów)
" dezaktywować Q (właczanie trybu Ex)
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>
map q <Nop>
map Q <Nop>

" przekierować C-p na C-b (domyślnie stronę wstecz dla vim)
" obecnie niepotrzebny
" nnoremap <C-p> <C-b>

" załadować plik .vimrc ponownie przez \sv
nnoremap <leader>sv :source $MYVIMRC<cr>

" wkleić tekst z systemowego schowka
nnoremap <leader>p "+p

" łatwiejszy Omnicomplete przez C-x
inoremap <C-x> <C-x><C-o>
" dalsza konfiguracja autouzupełnienia
set completeopt=longest,menuone

" dostosowanie rozmiar bufora
nmap <C-w> <Nop>
nmap <C-w>k :res -3<cr>
nmap <C-w>j :res +3<cr>
" nnoremap <silent> <C-Right> <c-w>l
" nnoremap <silent> <C-Left> <c-w>h
" nnoremap <silent> <C-Up> <c-w>k
" nnoremap <silent> <C-Down> <c-w>j

" ?
set ls=2

" włączanie podświetlanie dla szukania
set hlsearch

" sprawia że pojedyncze litery są zlikwidowane, zamiast skopiowane przez xXd
nnoremap x "_x
nnoremap X "_X
nnoremap <leader>d "_d

" wprowadzenie komendy globalnego znajdź i zamień
map R :%s:::g<Left><Left><Left>

" j+k idą do następnej wizualnej wierszy zamiast następnej prawdziwej
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" poruszanie się między buforami
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" łatwiejszie przemieszcanie się między oknami a buforami
noremap <silent> <C-l> gt
" noremap <silent> <C-h> gT
noremap <silent> <c-k> <C-W>k
noremap <silent> <c-j> <C-W>j

" wyłącz poruszenie się strzałkami
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" J+K przesuwają wskażnik 5 wierszy do góry/dołu
" pierwotnie J=połącz wierszy, K=pomoc
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" przemienia WEB z web
" noremap W w
" noremap E e
" noremap B b
" noremap w W
" noremap e E
" noremap b B


" tymczasowy skrót na komentowanie wierszy w coq
" jest to brzydki hak
nnoremap <F4> :s:^\(.*\)$:(\*\1\*):g<cr>:noh<cr>

" <F2> wywołuje zmiana między względnym a normalnym numerowaniem
" function! NumberToggle ()
" 	if (&relativenumber == 1)
" 		set norelativenumber
" 	else
" 		set relativenumber
" 	end
" endfunc
" nnoremap <F2> :call NumberToggle()<cr>
nnoremap <F2> :set relativenumber!<cr>

" zmienia tabulacje <F1>
function! TabToggle ()
	if (&tabstop== 4)
		set tabstop=2
	else
		set  tabstop=4
	end
endfunc
noremap <F1> :call TabToggle()<cr>

" <F3> wyłącza ostatnie podświetlenie
" nnoremap <F3> :noh<cr>
" nie rozumiem co to robi
nnoremap <silent> <Space> :silent noh<Bar>echo<cr>

" <F9> wywołuje make na obecnym pliku w szybie tmuksowym pod obecną
map <F9> :execute "!tmux-komp %"<cr>

" zmiany graficzne
" kolor podświetlenia
hi Search cterm=NONE ctermfg=black ctermbg=3
" hi Search guibg=peru guifg=wheat

" kolory dla zginięciach
hi Folded ctermbg=10 ctermfg=16

" podświetlenie pasek okien
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
" hi TabLineSel ctermfg=Red ctermbg=Yellow

" podświetlenie tabulacji (zbagowane)
" hi TabGroup ctermbg=23
" również 54 jest dobdy z motywem systemowym
" match TabGroup /^\/\/\|\t/

" NERDtree zignoruje pewne rozszerzenia plików
let NERDTreeIgnore = ['\.cmi$', '\.cmo$', '\.cmx','\.cma', '\.ml.d$', '\.mli.d$', '\.o$', '\.mllib$', '\.mllib.d$', '\.a$']

" naprawić konflikt merlina/ocamla z komendą-t
nmap <silent> <Leader>y <Plug>(CommandT)
" nmap <Leader>y @:MerlinTypeOf<CR>
" xmap <Leader>y @:MerlinTypeOfSel<CR>

" włączyć coq_IDE w vim
" let g:CoqIDEDefaultMap = 1

" GÓWNO dodane przez opam dla Merlina
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" GÓWNO koniec

