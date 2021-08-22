local M = {pause = 3000, timer = nil}

function M.scroll()
  print(string.format("Scroll %0.1f sec/line", M.pause / 1000))

  -- modifiable is off
  vim.bo["ma"] = false

  M.timer = vim.loop.new_timer()
  M.timer:start(
    100,
    M.pause,
    vim.schedule_wrap(
      function()
        local down = vim.api.nvim_replace_termcodes("normal <C-E>", true, true, true)
        vim.cmd(down)
      end
    )
  )
end

function M.toggle_scroll()
  if M.timer == nil then
    M.scroll()
  else
    M.stop_scrolling(true)
  end
end

function M.stop_scrolling(verbose)
  if M.timer ~= nil then
    if verbose then
      print("Stop scrolling")
    end
    M.timer:close()
    M.timer = nil

    -- modifiable is on
    vim.bo["ma"] = true
  end
end

function M.scroll_slower()
  M.change_scroll(1.2)
end

function M.scroll_faster()
  M.change_scroll(0.8)
end

function M.change_scroll(n)
  M.stop_scrolling(false)
  M.pause = M.pause * n
  M.scroll()
end

return M
