local obj={}
obj.__index = obj
obj.logger = hs.logger.new('KevSpoon')

-- ShiftIt
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

-- Custom shift
-- https://stackoverflow.com/a/58662204/9962307
hs.hotkey.bind({'alt', 'ctrl', 'cmd'}, 'n', function()
    -- get the focused window
    local win = hs.window.focusedWindow()
    -- get the screen where the focused window is displayed, a.k.a. current screen
    local screen = win:screen()
    -- compute the unitRect of the focused window relative to the current screen
    -- and move the window to the next screen setting the same unitRect
    win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

hs.hotkey.bind({'shift', 'alt', 'ctrl', 'cmd'}, 'n', function()
    -- get the focused window
    local win = hs.window.focusedWindow()
    -- get the screen where the focused window is displayed, a.k.a. current screen
    local screen = win:screen()
    -- compute the unitRect of the focused window relative to the current screen
    -- and move the window to the next screen setting the same unitRect
    win:move(win:frame():toUnitRect(screen:frame()), screen:previous(), true, 0)
end)

-- Open Hammerspoon
hs.hotkey.bind({'alt', 'ctrl', 'cmd'}, 'h', function()
    local result = hs.execute('open ~/.hammerspoon/init.lua')
    if not result then
        obj.logger:e("Unable to open Hammerspoon config file.")
    end
end)



-- Is it possible to do a focus mode?
-- This hotkey shortcut would turn down the brightness on all windows besides the focused window


-- ClipboardTool
-- mash = { 'ctrl', 'alt', 'cmd' }
hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool:bindHotkeys({
    toggle_clipboard = { { 'shift', 'cmd' }, 'V' }
})
spoon.ClipboardTool:clearAll()
spoon.ClipboardTool:start()

-- ColorPicker
-- hs.loadSpoon("ColorPicker")
-- spoon.ColorPicker.show_in_menubar = false
-- spoon.ColorPicker.bindHotkeys({
--     show = { { 'ctrl', 'cmd', 'cmd' }, 'P' }
-- })

-- Cherry (Pomodorro)
hs.loadSpoon("Cherry")
-- Default: (cmd-ctrl-alt-C)
-- Define after ShiftIt to give this priority.
spoon.Cherry:bindHotkeys({})
spoon.Cherry.notification = hs.notify.new({ title = "Done! 🍒", withdrawAfter = 0})


hs.loadSpoon("HSKeybindings")
hs.hotkey.bind({'shift', 'alt', 'ctrl', 'cmd'}, '/', function()
--     HSKeybindings:show()
end)

