# vim-deepl-translate

This is a Vim plugin that translates selected text into multiple languages using the DeepL API.

## Features

- Translate selected text in line-wise Visual Mode (`V`).
- Replaces the selected text with the translated text.
- Supported languages:
    - English (`EN`)
    - Japanese (`JA`)
    - Chinese (`ZH`)
    - Korean (`KO`)

## Requirements

- `curl`

## Installation

Use your favorite plugin manager.

For example, with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'ontheroadjp/vim-deepl-translate'
```

## Usage

1.  Set your DeepL API key in your `.vimrc` (see below).
2.  Select the text you want to translate in line-wise Visual Mode (`V`).
3.  Press one of the following key mappings:
    - `<leader>tr` or `<leader>en`: Translate to English.
    - `<leader>ja`: Translate to Japanese.
    - `<leader>zh`: Translate to Chinese.
    - `<leader>ko`: Translate to Korean.
4.  The selected text will be replaced with the translation.

## Configuration

### DeepL API Key

You need to set your DeepL API key in your `.vimrc`.

```vim
" Set your DeepL API key
let g:vimdeepltranslate_deepl_api_key = 'YOUR_DEEPL_API_KEY'
```

### Key Mapping

The default mappings are:
- `<leader>tr`, `<leader>en`: Translate to English
- `<leader>ja`: Translate to Japanese
- `<leader>zh`: Translate to Chinese
- `<leader>ko`: Translate to Korean

You can change them in your `.vimrc`.

```vim
" Example: Map to <leader>t for English translation
xnoremap <leader>t <Plug>(vimdeepltranslate-en)
```

## License

[MIT](LICENSE)