local config = require('txtr.config')
local util = require('txtr.util')

local txtr = require('txtr.txtr')

local function setup(opts)
  config = util.merge_tables(config, opts or {})
  txtr.pause = config.pause or 3000

  if not config.disable_config_keymap then
    local toggle_keymap = config.toggle_keymap or '<leader><leader>'
    local slower_keymap = config.scroll_slower_keymap or '<leader>j'
    local faster_keymap = config.scroll_faster_keymap or '<leader>k'


		vim.api.nvim_set_keymap(
			'n',
			toggle_keymap,
			":lua require('txtr').toggle_scroll()<cr>",
			{ silent = true, noremap = true }
		)

		vim.api.nvim_set_keymap(
			'n',
			slower_keymap,
			":lua require('txtr').scroll_slower()<cr>",
			{ silent = true, noremap = true }
		)

		vim.api.nvim_set_keymap(
			'n',
			faster_keymap,
			":lua require('txtr').scroll_faster()<cr>",
			{ silent = true, noremap = true }
		)
  end
end

return {
  setup = setup,
  toggle_scroll = txtr.toggle_scroll,
  scroll_faster = txtr.scroll_faster,
  scroll_slower = txtr.scroll_slower,
}
