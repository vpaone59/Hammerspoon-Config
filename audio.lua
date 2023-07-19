-- Detect when the current audio device is changed
-- Show current audio device nad volume level
function check_headphone_connectivity()
    curr_output = hs.audiodevice.defaultOutputDevice()
    hs.alert.show(math.floor(curr_output:volume() + 0.5) .. " - " .. curr_output:name())

end

hs.audiodevice.watcher.setCallback(check_headphone_connectivity)
hs.audiodevice.watcher.start()

if hs.audiodevice.watcher.isRunning() then
    check_headphone_connectivity()
end
