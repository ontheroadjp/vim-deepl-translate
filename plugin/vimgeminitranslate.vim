if exists('g:loaded_vimgeminitranslate')
  finish
endif
let g:loaded_vimgeminitranslate = 1

xnoremap <silent> <Plug>(vimgeminitranslate-translate) :<C-u>call vimgeminitranslate#TranslateSelectionToEnglish()<CR>

if !hasmapto('<Plug>(vimgeminitranslate-translate)', 'x')
  xnoremap <leader>tr <Plug>(vimgeminitranslate-translate)
endif
