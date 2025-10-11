if exists('g:loaded_gemini_translate')
  finish
endif
let g:loaded_gemini_translate = 1

command! GeminiTranslate execute "call vimgeminitranslate#TranslateSelectionToEnglish()"

xnoremap <leader>tr :<C-u>GeminiTranslate<CR>