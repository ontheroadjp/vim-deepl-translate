function! vimgeminitranslate#TranslateSelectionToEnglish()
  let l:start_line = line("'<")
  let l:end_line = line("'>")
  let l:text = join(getline(l:start_line, l:end_line), "\n")

  " Translate using Gemini CLI, filter out logs/warnings
  let l:translated = system('echo '.shellescape(l:text).' | gemini --model gemini-2.5-flash "Translate the following Japanese text to English:" 2>/dev/null | grep -v "DeprecationWarning" | grep -v "Loaded cached credentials"')

  " Replace selected lines with translation
  call setline(l:start_line, split(l:translated, "\n"))
  redraw!
endfunction
