# nvim-txtr

Txtr is a book and text reader for Neovim. It scrolls a text automatically,
so the user does not have to do it by hand. It also allows to control the
speed of scrolling, pause or resume the scrolling.

## Usage

For reading set current buffer to `readonly` with `:view` command.
By default `<leader><leader>` toggles autoscrolling, `<leader>j` slows
scrolling down, `<leader>k` speeds it up.

## Installation

You will need Neovim v0.5 or higher for this plugin to work.

* With Packer: `use 'dimus/nvim-txtr'`
* With vim-plug: `Plug 'dimus/nvim-txtr'`

## Configuration

```viml
:lua require('txtr').setup()
```

If Packer is used, configuration can be included into install:

```lua
use {
  'dimus/nvim-txtr',
  config = require('txtr').setup()
}
```

## Configuration parameters

The following parameters can be included into configuration:

```lua
require('txtr').setup({
  -- pause is the number of milliseconds between scrolling events
  pause = 4000,

  -- disable_config_keymap = true will cancel creation of default
  -- keybindings. If it is set true, keymaps have to be set manually.
  disable_config_keymap = false,

  -- toggle_keymap sets keybinding for toggling scrolling on/off, default
  -- toggle_keymap = '<leader><leader>'
  toggle_keymap = ',s',

  -- scroll_slower_keymap sets keybinding for slowing scrolling down, default
  -- scroll_slower_keymap = '<leader>j'
  scroll_slower_keymap = ',j',

  -- scroll_faster_keymap sets keybinding for speeding the scrolling up, the
  -- default scroll_faster_keymap = '<leader>k'
  scroll_faster = ',k'
})
```

## Manual keybinding setting

If keybinding by config is disabled, it can be set manually in viml

```viml
nmap <leader>s :lua require('txtr').toggle_scroll()<CR>
"   ^^^^^^^^^^ change this to what ever you want

nmap <leader>j :lua require('txtr').scroll_faster()<CR>
"   ^^^^^^^^^^ change this to what ever you want

nmap <leader>k :lua require('txtr').scroll_slower()<CR>
"   ^^^^^^^^^^ change this to what ever you want
```

Or in Lua

```lua

vim.api.nvim_set_keymap('n', '<leader>s', ":lua require('txtr').toggle_scroll()<cr>", {})
--                           ^^^^^^^^^^ change this to what ever you want

vim.api.nvim_set_keymap('n', '<leader>j', ":lua require('txtr').scroll_slower()<cr>", {})
--                           ^^^^^^^^^^ change this to what ever you want

vim.api.nvim_set_keymap('n', '<leader>k', ":lua require('txtr').scroll_faster()<cr>", {})
--                           ^^^^^^^^^^ change this to what ever you want
```

## Development

```bash
git clone git@github.com:dimus/nvim-txtr.git
cd nvim-txtr
```

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
