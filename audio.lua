-- when CX True Wireless Earbuds are connected
function check_headphone_connectivity()
    curr_output = hs.audiodevice.defaultOutputDevice()
    hs.alert.show(curr_output:volume() .. " - " .. curr_output:name())

    local val = hs.execute("/usr/local/bin/blueutil --is-connected CX Plus True Wireless")
    if string.sub(val, 1, 1) == "1" then
        hs.alert.show("Bluetooth Connected to CX")
    else
        hs.alert.show("Bluetooth Disconnected from CX")
        print("show")
    end
end

hs.audiodevice.watcher.setCallback(check_headphone_connectivity)
hs.audiodevice.watcher.start()
