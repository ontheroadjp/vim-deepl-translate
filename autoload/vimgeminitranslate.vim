function! vimgeminitranslate#TranslateSelectionToEnglish()
  try
    let l:engine = get(g:, 'vimgeminitranslate_engine', 'gemini')

    if l:engine ==# 'deepl'
      if !exists('g:vimgeminitranslate_deepl_api_key')
        echohl ErrorMsg
        echo "DeepL API key not set. Please set g:vimgeminitranslate_deepl_api_key in your vimrc."
        echohl None
        return
      endif
    endif

    let l:view = winsaveview()
    let l:original_register = getreg('"')
    let l:original_register_type = getregtype('"')

    normal! gvy
    let l:text = @"

    if empty(l:text)
      return
    endif

    let l:translated = ''
    if l:engine ==# 'gemini'
      let l:translated = s:TranslateWithGemini(l:text)
    elseif l:engine ==# 'deepl'
      let l:translated = s:TranslateWithDeepL(l:text)
    else
      echohl ErrorMsg
      echo "Invalid translation engine: " . l:engine
      echohl None
      return
    endif

    if empty(l:translated)
      return
    endif

    call setreg('"', l:translated)
    normal! gvp
  finally
    call setreg('"', l:original_register, l:original_register_type)
    call winrestview(l:view)
  endtry
  redraw!
endfunction

function! s:TranslateWithGemini(text)
  let l:translated = system('echo '.shellescape(a:text).' | gemini --model gemini-2.5-flash "Translate the following Japanese text to English:" 2>/dev/null | grep -v "DeprecationWarning" | grep -v "Loaded cached credentials"')
  return substitute(l:translated, '
$', '', '')
endfunction

function! s:TranslateWithDeepL(text)
  let l:api_key = g:vimgeminitranslate_deepl_api_key
  let l:endpoint = "https://api-free.deepl.com/v2/translate"
  let l:curl_cmd = printf(
  \   'curl -s -X POST %s -H "Authorization: DeepL-Auth-Key %s" --data-urlencode %s --data-urlencode "target_lang=EN"',
  \   shellescape(l:endpoint),
  \   shellescape(l:api_key),
  \   'text=' . shellescape(a:text)
  \)

  let l:response = system(l:curl_cmd)
  let l:response_dict = json_decode(l:response)

  if type(l:response_dict) != type({}) || !has_key(l:response_dict, 'translations')
    echohl ErrorMsg
    echo "DeepL API error: " . l:response
    echohl None
    return ''
  endif

  let l:translated = l:response_dict['translations'][0]['text']
  return substitute(l:translated, '
$', '', '')
endfunction