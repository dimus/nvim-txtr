# nvim-txtr

Txtr is a book and text reader for Neovim. It scrolls a text automatically,
so the user does not have to do it by hand. It also allows to controll the
speed of scrolling, pause or resume the scrolling.

## Installation

You will need Neovim v0.5 or higher for this plugin to work.

* With Packer: `use 'dimus/nvim-txtr'`
* With vim-plug: `Plug 'dimus/nvim-txtr'`

## Development

Add the project to `runtimepath` so nvim has access to the code during
development.

```bash
nvim --cmd 'set rtp+=.'
```

When nvim started, run once:

```vim
:luafile dev/init.lua
```

To refresh plugin use `,r`

To toggle scrolling use `,s`

To speed scrolling up use `,k`

To slow scrolling down use `,j`
