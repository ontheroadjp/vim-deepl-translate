function! vimgeminitranslate#TranslateSelectionToEnglish()
  if visualmode() != 'V'
    echohl ErrorMsg
    echo "Error: Only line-wise visual selection (V) is supported."
    echohl None
    return
  endif

  let l:start_line = getpos("'<")[1]
  let l:end_line = getpos("'>")[1]

  let l:text_lines = getline(l:start_line, l:end_line)
  let l:text = join(l:text_lines, "\n")

  if empty(l:text)
    return
  endif

  let l:translated = s:TranslateWithDeepL(l:text)

  if empty(l:translated)
    return
  endif

  let l:translated_lines = split(l:translated, '\n')
  
  execute l:start_line . ',' . l:end_line . 'd'
  call append(l:start_line - 1, l:translated_lines)

  redraw
endfunction

function! s:TranslateWithDeepL(text)
  if !exists('g:vimgeminitranslate_deepl_api_key')
    echohl ErrorMsg
    echo "DeepL API key not set. Please set g:vimgeminitranslate_deepl_api_key in your vimrc."
    echohl None
    return ''
  endif

  let l:api_key = g:vimgeminitranslate_deepl_api_key
  let l:endpoint = "https://api-free.deepl.com/v2/translate"
  let l:curl_cmd = printf(
  \   'curl -s -X POST %s -H "Authorization: DeepL-Auth-Key %s" --data-urlencode %s --data-urlencode "target_lang=EN"',
  \   shellescape(l:endpoint),
  \   l:api_key,
  \   'text=' . shellescape(a:text)
  	)

  let l:response = system(l:curl_cmd)
  let l:response_dict = json_decode(l:response)

  if type(l:response_dict) != type({}) || !has_key(l:response_dict, 'translations')
    echohl ErrorMsg
    echo "DeepL API error: " . l:response
    echohl None
    return ''
  endif

  let l:translated = l:response_dict['translations'][0]['text']
  return substitute(l:translated, nr2char(10).'$', '', '')
endfunction