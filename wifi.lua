-- -- replace homeSSID with your home WiFi name
-- homeSSID = "paone"
-- workSSID = "RowanSecure"
-- -- whenever the SSID changes, the watcher will callback this function
-- function wifiChange()
--     is_wifi_on()
--     currSSID = hs.wifi.currentNetwork()
--     if currSSID == homeSSID then
--         -- if connected to homeSSID - paone
--         hs.alert.show("connected to " + currSSID + ", vol 0")
--     elseif currSSID == workSSID then
--         -- if connected to workSSID - RowanSecure
--         hs.alert.show("connected to " + currSSID + ", vol 0")
--         hs.audiodevice.defaultOutputDevice():setVolume(0)
--     else
--         -- else there's no wifi
--         hs.alert.show(currSSID .. "no wifi")
--     end
-- end
-- -- check if wifi is currently on
-- function is_wifi_on()
--     wifi_check = hs.wifi.interfaceDetails()
--     msg = string.format("wifi state %s", wifi_check["power"])
--     hs.alert.show(msg)
--     hs.alert.show(wifi_check .. "status")
-- end
-- -- start the wifi watcher
-- -- SSIDChange is watched for by default from the watcher
-- -- https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/wifi/libwifi_watcher.m#L215
-- wifiWatcher = hs.wifi.watcher.new(wifiChange)
-- wifiWatcher:start()
-- Function to set the volume to 0
function setVolumeToZero()
    hs.audiodevice.defaultOutputDevice():setVolume(0)
end

-- Function to set the volume to the previous value
function restoreVolume()
    hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume)
end

-- Monitor Wi-Fi events
wifiWatcher = hs.wifi.watcher.new(function()
    local currentSSID = hs.wifi.currentNetwork()
    if currentSSID == nil then
        -- No Wi-Fi connection, set volume to 0
        setVolumeToZero()
    elseif currentSSID == "RowanSecure" then
        -- Connected to specific Wi-Fi SSID, set volume to 0
        setVolumeToZero()
    else
        -- Connected to another Wi-Fi SSID, restore previous volume
        restoreVolume()
    end
end)

-- Start monitoring Wi-Fi events
wifiWatcher:start()
