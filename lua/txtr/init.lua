local config = require('txtr.config')
local util = require('txtr.util').util

local txtr = require('txtr.txtr').txtr

local function setup(opts)
  config = util.merge_tables(config, opts or {})
  txtr.pause = config.pause or 3000

  if not config.disable_config_keymap then
    local toggle_keymap = config.toggle_keymap or ',s'
    local slower_keymap = config.scroll_slower_keymap or ',j'
    local faster_keymap = config.scroll_faster_keymap or ',k'


		vim.api.nvim_set_keymap(
			'n',
			toggle_keymap,
			":lua require('txtr').txtr.toggle_scroll()<cr>",
			{ silent = true, normap = true }
		)

		vim.api.nvim_set_keymap(
			'n',
			slower_keymap,
			":lua require('txtr.txtr').txtr.scroll_slower()<cr>",
			{ silent = true, normap = true }
		)

		vim.api.nvim_set_keymap(
			'n',
			faster_keymap,
			":lua require('txtr').txtr.scroll_faster()<cr>",
			{ silent = true, normap = true }
		)
  end
end

return {
  setup = setup,
  toggle_scroll = txtr.toggle_scroll,
  scroll_faster = txtr.scroll_faster,
  scroll_slower = txtr.scroll_slower,
}
