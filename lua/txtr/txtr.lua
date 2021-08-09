local M = {sleep = 3000, timer = nil}

function M.down()
  print(string.format('scroll %0.1f sec/line', M.sleep/1000))
  M.timer = vim.loop.new_timer()
  M.timer:start(M.sleep, M.sleep, vim.schedule_wrap(function()
    local down = vim.api.nvim_replace_termcodes('normal <C-E>', true, true, true)
    vim.cmd(down)
  end))
end

function M.toggle()
  if M.timer == nil then
    M.down()
  else
    M.down_stop()
  end
end

function M.down_stop()
  if M.timer ~= nil then
    M.timer:close()
    M.timer = nil
  end
end

function M.down_slower()
  M.down_change(1.2)
end

function M.down_faster()
  M.down_change(0.8)
end

function M.down_change(n)
  M.down_stop()
  M.sleep = M.sleep*n
  M.down()
end

return M
