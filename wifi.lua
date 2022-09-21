-- replace homeSSID with your homeSSID
wifiWatcher = nil
homeSSID = "paone"
workSSID = "RowanSecure"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- if connected to home
        hs.alert.show("wifi !")

    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- if disconnected from home network
        hs.alert.show("wifi !!")
        hs.alert.show("volume 0")
        hs.audiodevice.defaultOutputDevice():setVolume(0)

    elseif newSSID ~= homeSSID and lastSSID ~= homeSSID then
        -- if disconnected from any network
        hs.alert.show("wifi disc.")
        hs.alert.show("volume 0")
        hs.audiodevice.defaultOutputDevice():setVolume(0)

    end

    lastSSID = newSSID
end

function get_wifi_name()
    curr = hs.wifi.currentNetwork()
    hs.alert.show(curr)
end
get_wifi_name()

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
