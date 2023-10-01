-- reloads the config on file update
function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        -- if the last 4 chars are .lua
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded", .25)

require('/configs/wifi')
-- require('audio')
require('/configs/window')
