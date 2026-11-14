local config_directory = assert(arg[0]:match("^(.*)/"), "Run with a path to this file")
local bindings = {}
local process_result, process_error, focus_result, focus_error, focused_direction

rex = {
  bind = function(key, action, arguments)
    assert(not bindings[key], "Duplicate binding: " .. key)
    bindings[key] = { action = action, arguments = arguments }
  end,
  block = {
    call = function()
      return process_result, process_error
    end,
  },
  session = {
    focus_direction = function(arguments)
      focused_direction = arguments.direction
      assert(arguments.wrap)
      return focus_result, focus_error
    end,
  },
}

dofile(config_directory .. "/init.lua")

-- given
local navigation_keys = { h = "left", j = "down", k = "up", l = "right" }
process_result, focus_result = { foreground = { name = "zsh" } }, {}

-- when
for key, direction in pairs(navigation_keys) do
  focused_direction = nil
  local handled = bindings["ctrl+" .. key].action()

  -- then
  assert(handled and focused_direction == direction)
end

-- given
local terminal_programs = { "nvim", "vim", "view", "fzf", "tmux" }

-- when
for _, program in ipairs(terminal_programs) do
  process_result, focused_direction = { foreground = { name = program } }, nil
  local handled = bindings["ctrl+h"].action()

  -- then
  assert(not handled and focused_direction == nil)
end

-- given
process_result, process_error = nil, "Cannot read process"

-- when
local process_succeeded = pcall(bindings["ctrl+h"].action)

-- then
assert(not process_succeeded)

-- given
process_result, process_error = {}, nil
focus_result, focus_error = nil, "Cannot focus pane"

-- when
local focus_succeeded = pcall(bindings["ctrl+h"].action)

-- then
assert(not focus_succeeded)

-- given
local newline_binding = bindings["shift+enter"]
local split_binding = bindings["ctrl+a>shift+5"]

-- when
local newline_action, newline_data = newline_binding.action, newline_binding.arguments.data
local split_action, split_direction = split_binding.action, split_binding.arguments.direction

-- then
assert(newline_action == "com.superlogical.terminal.write" and newline_data == "\27\r")
assert(split_action == "pane.split" and split_direction == "right")

-- given
local editor_bindings, editor_window, next_editor_window, rex_command = {}, "first", "first", nil
vim = {
  env = { REX_SESSION = "test-session" },
  api = { nvim_get_current_win = function() return editor_window end },
  cmd = function() editor_window = next_editor_window end,
  keymap = { set = function(_, key, callback) editor_bindings[key] = callback end },
  system = function(command)
    rex_command = command
    return { wait = function() return { code = 0 } end }
  end,
}
dofile(config_directory .. "/../nvim/lua/config/keymaps.lua")

-- when
editor_bindings["<C-h>"]()

-- then
assert(rex_command[1] == "rex" and rex_command[3] == "left")
assert(rex_command[6] == vim.env.REX_SESSION)

-- given
next_editor_window, rex_command = "second", nil

-- when
editor_bindings["<C-h>"]()

-- then
assert(editor_window == next_editor_window and rex_command == nil)
print("Rex navigation and bindings passed")
