package.loaded['dev'] = nil
package.loaded['txtr'] = nil
package.loaded['txtr.txtr'] = nil

vim.api.nvim_set_keymap('n', ',r', ':luafile dev/init.lua<cr>', {})

Txtr = require('txtr')

vim.api.nvim_set_keymap('n', ',w', ':lua Txtr.say()<cr>', {})

