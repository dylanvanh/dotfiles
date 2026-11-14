local navigation_keys = { h = "left", j = "down", k = "up", l = "right" }

-- Keep navigation inside Vim and fzf until the program passes it to Rex.
for key, direction in pairs(navigation_keys) do
  rex.bind("ctrl+" .. key, function()
    local process, process_error = rex.block.call("com.superlogical.terminal", "process", {})
    if not process then
      error(process_error)
    end

    local foreground_name = process.foreground and process.foreground.name or ""
    if foreground_name:match("vim") or foreground_name == "view" or foreground_name == "fzf"
      or foreground_name == "tmux" then
      return false
    end

    local result, focus_error = rex.session.focus_direction({ direction = direction, wrap = true })
    if not result then
      error(focus_error)
    end
    return true
  end)
end

rex.bind("alt+shift+h", "client.tab.previous")
rex.bind("alt+shift+l", "client.tab.next")
rex.bind("shift+enter", "com.superlogical.terminal.write", { data = "\27\r" })

rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" })
rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>n", "client.tab.next")
rex.bind("ctrl+a>p", "client.tab.previous")
rex.bind("ctrl+a>ctrl+n", "client.tab.next")
rex.bind("ctrl+a>ctrl+p", "client.tab.previous")
rex.bind("ctrl+a>,", "client.tab.rename")
rex.bind("ctrl+a>shift+4", "session.rename")
rex.bind("ctrl+a>shift+9", "session.previous")
rex.bind("ctrl+a>shift+0", "session.next")
rex.bind("ctrl+a>s", "pane.go_to")
rex.bind("ctrl+a>w", "pane.go_to")
rex.bind("ctrl+a>shift+k", "session.switch")
rex.bind("ctrl+a>shift+r", "client.config.reload")

rex.bind("ctrl+a>shift+5", "pane.split", { direction = "right" })
rex.bind("ctrl+a>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+a>z", "pane.zoom")
rex.bind("ctrl+a>o", "pane.focus_next")
rex.bind("ctrl+a>shift+1", "pane.move_to_new_tab")
rex.bind("ctrl+a>shift+e", "pane.balance")
rex.bind("ctrl+a>x", "pane.close")
rex.bind("ctrl+a>shift+7", "client.tab.close")
rex.bind("ctrl+a>]", "pane.paste")
rex.bind("ctrl+a>ctrl+l", "pane.send_key", { key = "ctrl+l" })

for _, direction in ipairs({ "left", "right", "up", "down" }) do
  rex.bind("ctrl+a>" .. direction, "pane.focus", { direction = direction })
  rex.bind("ctrl+a>ctrl+" .. direction, "pane.resize", { direction = direction })
  rex.bind("ctrl+a>alt+" .. direction, "pane.resize", { direction = direction })
end

local first_tab_index, last_numbered_tab_index = 1, 9
for tab_index = first_tab_index, last_numbered_tab_index do
  rex.bind("ctrl+a>" .. tab_index, "client.tab.goto", { index = tab_index })
end
