-- change CX Plus True Wireless with your bluetooth SSID
function check_headphone_connectivity()
    local val = hs.execute("/usr/local/bin/blueutil --is-connected CX Plus True Wireless")
    if string.sub(val, 1, 1) == "1" then
        hs.alert.show("Bluetooth Connected to CX")
    else
        hs.alert.show("Bluetooth Disconnected from CX")
    end
end

function get_device_name()
    name = hs.audiodevice:name()
    hs.alert.show(name)
end

hs.audiodevice.watcher.setCallback(check_headphone_connectivity)
hs.audiodevice.watcher.setCallback(get_device_name)
hs.audiodevice.watcher.start()
