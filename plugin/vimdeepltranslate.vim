if exists('g:loaded_vimdeepltranslate')
  finish
endif
let g:loaded_vimdeepltranslate = 1

" EN
xnoremap <silent> <Plug>(vimdeepltranslate-en) :<C-u>call vimdeepltranslate#TranslateSelection('EN')<CR>
if !hasmapto('<Plug>(vimdeepltranslate-en)', 'x')
  xnoremap <leader>tr <Plug>(vimdeepltranslate-en)
  xnoremap <leader>en <Plug>(vimdeepltranslate-en)
endif

" JA
xnoremap <silent> <Plug>(vimdeepltranslate-ja) :<C-u>call vimdeepltranslate#TranslateSelection('JA')<CR>
if !hasmapto('<Plug>(vimdeepltranslate-ja)', 'x')
  xnoremap <leader>ja <Plug>(vimdeepltranslate-ja)
endif

" ZH
xnoremap <silent> <Plug>(vimdeepltranslate-zh) :<C-u>call vimdeepltranslate#TranslateSelection('ZH')<CR>
if !hasmapto('<Plug>(vimdeepltranslate-zh)', 'x')
  xnoremap <leader>zh <Plug>(vimdeepltranslate-zh)
endif

" KO
xnoremap <silent> <Plug>(vimdeepltranslate-ko) :<C-u>call vimdeepltranslate#TranslateSelection('KO')<CR>
if !hasmapto('<Plug>(vimdeepltranslate-ko)', 'x')
  xnoremap <leader>ko <Plug>(vimdeepltranslate-ko)
endif