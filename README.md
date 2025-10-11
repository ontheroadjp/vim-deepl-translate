# vim-gemini-translate

This is a Vim plugin that translates selected text into English using the Gemini CLI.

## Features

- Translate selected text in Visual Mode.
- Replaces the selected text with the translated English text.

## Requirements

- [Gemini CLI](https://github.com/google/generative-ai-python)

Please ensure that the `gemini` command is available in your shell's PATH.

## Installation

Use your favorite plugin manager.

For example, with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'your-github-username/vim-gemini-translate'
```

## Usage

1.  Select the text you want to translate in Visual Mode.
2.  Press `<leader>tr`.
3.  The selected text will be replaced with the English translation.

## Configuration

You can change the key mapping in your `.vimrc`.

```vim
" Example: Map to <leader>t
xnoremap <leader>t <leader>tr
```

## License

[MIT](LICENSE)
