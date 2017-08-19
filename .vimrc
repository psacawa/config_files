" włącz rozpoznanie wtyczek zależnych od rozszerzenia pliku?? (głównie merlin)
" na razie powoduje konflikty między opam merlian a command-t
filetype plugin on

" zestartuj pathogen
execute pathogen#infect()

" wyłączyć automatyczne komentarze
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" natychmiastowe wyszukiwanie niepłnych haseł
set incsearch

" na czas gdy klawiatura będzie zepsuta
" automycznie otwórz bufora dla wpsiania komend
nnoremap : :<C-f>i

" szybsze wczytanie <Esc>?? (CHYBA NIEPOTRZEBNE)
" set esckeys
" set timeoutlen=100 ttimeoutlen=0

" numerowane linie
set number

" podświetlenie syntaksu
syntax on

" tabulacja
set tabstop=4
set ruler
set backspace=2

" dezaktywować Ins i q (nagrywanie macrów)
" dezaktywować Q (właczanie trybu Ex)
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>
map q <Nop>
map Q <Nop>
map <F1> <Nop>

" przekierować C-p na C-b (domyślnie stronę wstecz dla vim)
" obecnie niepotrzebny
" nnoremap <C-p> <C-b>

" załadować plik .vimrc ponownie przez \sv
nnoremap <leader>sv :source $MYVIMRC<cr>

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

" pasek statusu
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ?
set ls=2

" włączanie podświetlanie dla szukania
set hlsearch

" sprawia że pojedyncze litery są zlikwidowane, zamiast skopiowane przez x
nnoremap x "_x
nnoremap <leader>d "_d

" podświetlenie tabulacji
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen

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

" łatwiejszie przemieszcanie się między tabami
nmap <C-l> gt
nmap <C-h> gT

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

" <F2> wywołuje zmiana między względnym a normalnym numerowaniem
function! NumberToggle ()
	if (&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	end
endfunc
nnoremap <F2> :call NumberToggle()<cr>

" <F3> wyłącza ostatnie podświetlenie
nmap <F3> :noh<cr>

" NERDtree zignoruje pewne rozszerzenia plików
let NERDTreeIgnore = ['\.cmi$', '\.cmo$', '\.cmx','\.cma', '\.ml.d$', '\.mli.d$', '\.o$', '\.mllib$', '\.mllib.d$', '\.a$']

" naprawić konflikt merlina/ocamla z komendą-t
nmap <silent> <Leader>y <Plug>(CommandT)
" nmap <Leader>y @:MerlinTypeOf<CR>
" xmap <Leader>y @:MerlinTypeOfSel<CR>

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
