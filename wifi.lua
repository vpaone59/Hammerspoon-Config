-- replace homeSSID with your homeSSID
-- wifiWatcher = nil
homeSSID = "paone"
workSSID = "RowanSecure"
lastSSID = hs.wifi.currentNetwork()

function ssidChange()

    newSSID = hs.wifi.currentNetwork()
    if newSSID == homeSSID then
        -- if connected to home
        hs.alert.show(newSSID .. " wifi !!")

    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- if disconnected from home network
        hs.alert.show(newSSID .. " wifi disc. !!")

    elseif newSSID == workSSID then
        -- if connected to 
        hs.alert.show(newSSID .. " wifi disc, vol 0")
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    else
        hs.alert.show(newSSID .. "NO WIFI !")
    end
    lastSSID = newSSID
end

-- check if wifi is currently on
function is_wifi_on()
    wifi_check = hs.wifi.interfaceDetails()
    hs.alert.show(wifi_check[0])
end

-- check current wifi and return the SSID
function get_wifi_name()
    curr = hs.wifi.currentNetwork()
    hs.alert.show(curr)
end

wifiWatcher = hs.wifi.watcher.new(ssidChange)
wifiWatcher:start()
