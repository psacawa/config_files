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

" dla NERDcommentera
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" wyłączyć automatyczne komentarze
" zapomniałem co to robi
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" natychmiastowe wyszukiwanie niepłnych haseł
set incsearch

" parowane nawiasy będzie można rozróżnić łatwiej
hi MatchParen cterm=none ctermbg=16 ctermfg=white


" ZEPSUTE
" automatyczna indentacja kiedy stosowany operator o
" nnoremap o :set ai<CR>o<Esc>:set ai!<CR>
set ai

" przedziel obecny wiersz na dwa w miejscu wskażnika
nnoremap <leader>o i<Enter><Esc>k$


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
set noexpandtab
" teraz >> daje jedną indentację
set shiftwidth=0
" naiwna retabulacja
" ?

" zginięcie syntaktyczne
" na razie uważam to za eksperymentalne
" set foldmethod=indent
" set foldmethod=syntax
" set foldlevel=0
" set foldclose=all

" chrzanić te auto-zgnięcia - ta komenda pozwala to robić ręcznie
" i zapisuje i ładuje wszystko automatycznie
"autocmd BufWinLeave *.* mkview
autocmd BufWritePost *.* mkview
autocmd BufWinEnter *.* silent loadview

" dezaktywować Ins i q (nagrywanie macrów)
" dezaktywować Q (właczanie trybu Ex)
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>
map q <Nop>
map Q <Nop>

" smartcase wyszukiwanie
" czyli ścisłe rozróżnianie wielkości liter wtw gdy jest duża litera
" chyba nie działa
set smartcase

" po to by n i N nie lądowały na skraju widzialnej części pliku
set scrolloff=10

" załadować plik .vimrc ponownie przez \sv
nnoremap <leader>sv :source $MYVIMRC<cr>

" wkleić/skopiować tekst z/do systemowego schowka
nnoremap <leader>p "+p
nnoremap <leader>P "+P
noremap <leader>y "+y
" skopiować do końca wierszy
nnoremap Y y$

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
" nnoremap <leader>d "_d

" macro an usunięcie całego bloku {} i ()
" wraz z wierszem na którym się rozpoczyna
nnoremap daB daBdd
nnoremap dab dabdd

" zlikwidować treść nastepnego/ostatniego nawiasa ()
" drugi nie działa ...
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

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
noremap <silent> <C-h> gT
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

" połączyć wiersze
nnoremap Q J

" makro na dodawanie i usunięcia komentarzy do bloków w trybie wizualnym
" wyłacznie dla komentarzy // w stylu c
vmap + :s:^://:g<CR><Space>
vmap - :s:^//::g<CR><Space>

" zostać w trybie wizualniym po zmianach na indentację
vnoremap < <gv
vnoremap > >gv

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

" by widać informacje o zginięciach w 'rynsztoku'
noremap <F8>- :set foldcolumn-=1<cr>
noremap <F8>+ :set foldcolumn+=1<cr>

" manewrowanie przez listę błedów (:lopen)
" nnoremap -n :lnext<CR>
" nnoremap -N :lprev<CR>

" YCM skróty
" wymusić ponowną kompilację przez ycm
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>:ccl<CR>
nnoremap <leader>ft :YcmCompleter GetType<CR>
nnoremap <leader>fc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>fl :YcmCompleter GoToDefinition<CR>
" tylko dla pythona, js, ...
" nnoremap <leader>fr :YcmCompleter GoToReferences<CR>

" zmiany graficzne
" kolor podświetlenia
hi Search cterm=none ctermfg=black ctermbg=3
" zmiany koloru podświetlenia w trybie wizualnym
hi Visual cterm=none ctermbg=235

" pasek statusu
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" kolory dla paska
hi StatusLine ctermbg=white ctermfg=53

" kolory dla zginięciach
hi Folded ctermbg=10 ctermfg=16
hi FoldColumn ctermbg=15  ctermfg=black

" podświetlenie pasek okien
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
" hi TabLineSel ctermfg=Red ctermbg=Yellow

" podświetlenie tabulacji (zbagowane)
" hi TabGroup ctermbg=23
" również 54 jest dobdy z motywem systemowym
" match TabGroup /^\/\/\|\t/

" ycm graficzna konfiguracja
hi YcmErrorLine cterm=none
hi YcmWarningLine cterm=none
" różne opcje YCM dotyczące błędów
let g:ycm_show_diagnostics_ui =1
" symbole w rynsztoku (wyłączone)
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '<<'
" wyłączyć autopodświetlenie błedów i uwas dla YCM?
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting =0
nnoremap <F6> :let g:ycm_enable_diagnostic_highlighting!<cr>
" klawisz do wyśœietlenia pełnego tekstu błędów kompilatora
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_always_populate_location_list=1
" specyficznie dla YCM
nnoremap g< :lnext<cr>
nnoremap g> :lprevious<cr>

" NERDtree zignoruje pewne rozszerzenia plików
let NERDTreeIgnore = ['\.cmi$', '\.cmo$', '\.cmx','\.cma', '\.ml.d$', '\.mli.d$', '\.o$', '\.mllib$', '\.mllib.d$', '\.a$']

" naprawić konflikt merlina/ocamla z komendą-t (którego zresztą już nie uzywamy)
" nmap <silent> <Leader>y <Plug>(CommandT)
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

" ycm odrobaczenie
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" autopoprawa częstych błędów ortograficznych
iabbrev ednl endl
iabbrev cotu cout
