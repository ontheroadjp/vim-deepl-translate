# vim-deepl-translate

This is a Vim plugin that translates selected text into English using the DeepL API.

## Features

- Translate selected text in line-wise Visual Mode (`V`).
- Replaces the selected text with the translated English text.

## Requirements

- `curl`

## Installation

Use your favorite plugin manager.

For example, with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'ontheroadjp/vim-gemini-translate'
```

## Usage

1.  Set your DeepL API key in your `.vimrc` (see below).
2.  Select the text you want to translate in line-wise Visual Mode (`V`).
3.  Press `<leader>tr` (or your custom mapping).
4.  The selected text will be replaced with the English translation.

## Configuration

### DeepL API Key

You need to set your DeepL API key in your `.vimrc`.

```vim
" Set your DeepL API key
let g:vimgeminitranslate_deepl_api_key = 'YOUR_DEEPL_API_KEY'
```

### Key Mapping

The default mapping is `<leader>tr`. You can change it in your `.vimrc`.

```vim
" Example: Map to <leader>t
xnoremap <leader>t <Plug>(vimgeminitranslate-translate)
```

## License

[MIT](LICENSE)