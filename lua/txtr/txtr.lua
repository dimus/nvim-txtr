local M = {pause = 3000, timer = nil}

function M.scroll()
  print(string.format('scroll %0.1f sec/line', M.pause/1000))
  M.timer = vim.loop.new_timer()
  M.timer:start(M.pause, M.pause, vim.schedule_wrap(function()
    local down = vim.api.nvim_replace_termcodes('normal <C-E>', true, true, true)
    vim.cmd(down)
  end))
end

function M.toggle_scroll()
  if M.timer == nil then
    M.scroll()
  else
    M.stop_scrolling()
  end
end

function M.stop_scrolling()
  if M.timer ~= nil then
    M.timer:close()
    M.timer = nil
  end
end

function M.scroll_slower()
  M.change_scroll(1.2)
end

function M.scroll_faster()
  M.change_scroll(0.8)
end

function M.change_scroll(n)
  M.stop_scrolling()
  M.pause = M.pause*n
  M.scroll()
end

return M
