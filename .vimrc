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

" pasek statusu
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ?
set ls=2

" włączanie podświetlanie dla szukania
set hlsearch

" sprawia że pojedyncze litery są zlikwidowane, zamiast skopiowane przez x
nnoremap x "_x

" podświetlenie tabulacji
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen

" j+k idą do następnej wizualnej wierszy zamiast następnej prawdziwej
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

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
