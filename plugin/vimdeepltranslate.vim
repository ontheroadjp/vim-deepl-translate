if exists('g:loaded_vimdeepltranslate')
  finish
endif
let g:loaded_vimdeepltranslate = 1

xnoremap <silent> <Plug>(vimdeepltranslate-translate) :<C-u>call vimdeepltranslate#TranslateSelectionToEnglish()<CR>

if !hasmapto('<Plug>(vimdeepltranslate-translate)', 'x')
  xnoremap <leader>tr <Plug>(vimdeepltranslate-translate)
endif