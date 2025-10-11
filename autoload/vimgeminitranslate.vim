function! vimgeminitranslate#TranslateSelectionToEnglish()
  try
    let l:view = winsaveview()
    let l:original_register = getreg('"')
    let l:original_register_type = getregtype('"')

    " Yank the visually selected text into the unnamed register.
    normal! gvy
    let l:text = @"

    " Bail if the selection is empty
    if empty(l:text)
      return
    endif

    " Translate using Gemini CLI, filter out logs/warnings
    let l:translated = system('echo '.shellescape(l:text).' | gemini --model gemini-2.5-flash "Translate the following Japanese text to English:" 2>/dev/null | grep -v "DeprecationWarning" | grep -v "Loaded cached credentials"')
    " Remove trailing newline from system command output
    let l:translated = substitute(l:translated, '
$', '', '')

    " Put the translated text into the unnamed register.
    call setreg('"', l:translated)

    " Reselect the last visual area and replace it with the content of the unnamed register.
    normal! gvp
  finally
    " Restore the original unnamed register and view.
    call setreg('"', l:original_register, l:original_register_type)
    call winrestview(l:view)
  endtry
  redraw!
endfunction