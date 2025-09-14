# TodoForge.nvim

A simple and fun Neovim plugin to manage your todos in a floating window.

## ✨ Features

- Opens a floating buffer for quick todos
- Automatically creates a `todo.md` with a starter template
- Buffer-local keymaps for save and quit
- No global pollution

## 🚀 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "hemanthhari2000/todoforge.nvim",
  opts = {
    todo_file = "~/.todoforge.nvim/todo.md",
    keymaps = {
      open = "<leader>tdf",
      float = {
        quit = "q",
        save = "<C-s>",
      },
    },
  },
}
```

## 🗒️ Usage

Open the floating todo window:

```vim
# command
:Tdf

# default nvim keymap
<leader>tdf
```

## 🤝 Contributing

PRs are welcome! Add new features, fix bugs, or suggest improvements.

## 📜 License

MIT © [Hemanth](https://github.com/hemanthhari2000)
