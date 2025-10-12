# vim-gemini-translate

This is a Vim plugin that translates selected text into English using the Gemini CLI or DeepL API.

## Features

- Translate selected text in Visual Mode.
- Replaces the selected text with the translated English text.
- Supports two translation engines: Gemini CLI and DeepL API.

## Requirements

- [Gemini CLI](https://github.com/google/generative-ai-python) (if using the 'gemini' engine)
- `curl` (if using the 'deepl' engine)

Please ensure that the `gemini` command is available in your shell's PATH if you use the 'gemini' engine.

## Installation

Use your favorite plugin manager.

For example, with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'ontheroadjp/vim-gemini-translate'
```

## Usage

1.  Configure the plugin (see below).
2.  Select the text you want to translate in Visual Mode.
3.  Press `<leader>tr` (or your custom mapping).
4.  The selected text will be replaced with the English translation.

## Configuration

### Key Mapping

The default mapping is `<leader>tr`. You can change it in your `.vimrc`.

```vim
" Example: Map to <leader>t
xnoremap <leader>t <Plug>(vimgeminitranslate-translate)
```

### Translation Engine

You can choose the translation engine by setting `g:vimgeminitranslate_engine`.
The available engines are `'gemini'` (default) and `'deepl'`.

```vim
" Use DeepL for translation
let g:vimgeminitranslate_engine = 'deepl'
```

If you use DeepL, you need to set your API key.

```vim
" Set your DeepL API key
let g:vimgeminitranslate_deepl_api_key = 'YOUR_DEEPL_API_KEY'
```

## License

[MIT](LICENSE)