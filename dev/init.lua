package.loaded['dev'] = nil
package.loaded['txtr'] = nil
package.loaded['txtr.txtr'] = nil

vim.api.nvim_set_keymap('n', ',r', ':luafile dev/init.lua<cr>', {})

Txtr = require('txtr').txtr

vim.api.nvim_set_keymap('n', ',s', ':lua Txtr.toggle()<cr>', {})
vim.api.nvim_set_keymap('n', ',k', ':lua Txtr.down_faster()<cr>', {})
vim.api.nvim_set_keymap('n', ',j', ':lua Txtr.down_slower()<cr>', {})

