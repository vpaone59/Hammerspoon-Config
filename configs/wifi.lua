workSSID = "RowanSecure"

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
    elseif currentSSID == workSSID then
        -- Connected to specific Wi-Fi SSID, set volume to 0
        setVolumeToZero()
    else
        -- Connected to another Wi-Fi SSID, restore previous volume
        restoreVolume()
    end
end)

-- Start monitoring Wi-Fi events
wifiWatcher:start()
