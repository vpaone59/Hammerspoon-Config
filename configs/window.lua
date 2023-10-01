-- Window arrangement keybinds
-- Maximize Window
hs.hotkey.bind({'cmd', 'ctrl'}, 'up', function()
    curr_win = hs.window.focusedWindow()
    if curr_win:isMaximizable() == true then
        curr_win:maximize()
    end
end)

-- Minimize Window
hs.hotkey.bind({'cmd', 'ctrl'}, 'down', function()
    curr_win = hs.window.focusedWindow()
    if curr_win:isMinimized() == false then
        curr_win:minimize()
    end
end)

-- Center of the screen
-- shrink
hs.hotkey.bind({'cmd', 'ctrl'}, 'N', function()
    hs.window.focusedWindow():moveToUnit({0.15, 0.1, 0.7, 0.8})
end)
-- normal size
hs.hotkey.bind({'cmd', 'ctrl'}, 'M', function()
    hs.window.focusedWindow():moveToUnit({0.06, 0.04, 0.88, 0.9})
end)

-- left / right half of screen
hs.hotkey.bind({'cmd', 'ctrl'}, 'left', function()
    hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1})
end)
hs.hotkey.bind({'cmd', 'ctrl'}, 'right', function()
    hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 1})
end)

-- Left | Middle | Right configuration
-- left
hs.hotkey.bind({'cmd', 'ctrl'}, '[', function()
    hs.window.focusedWindow():moveToUnit({0, 0, 0.33, 1})
end)
-- middle
hs.hotkey.bind({'cmd', 'ctrl'}, '=', function()
    hs.window.focusedWindow():moveToUnit({0.33, 0, 0.34, 1})
end)
-- right
hs.hotkey.bind({'cmd', 'ctrl'}, ']', function()
    hs.window.focusedWindow():moveToUnit({0.67, 0, 0.33, 1})
end)

-- Quadrants
-- top left
hs.hotkey.bind({'cmd', 'ctrl'}, 'k', function()
    hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 0.5})
end)
-- bottom left
hs.hotkey.bind({'cmd', 'ctrl'}, ',', function()
    hs.window.focusedWindow():moveToUnit({0, 0.5, 0.5, 0.5})
end)

-- top right
hs.hotkey.bind({'cmd', 'ctrl'}, 'l', function()
    hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 0.5})
end)
-- bottom right
hs.hotkey.bind({'cmd', 'ctrl'}, '.', function()
    hs.window.focusedWindow():moveToUnit({0.5, 0.5, 0.5, 0.5})
end)
