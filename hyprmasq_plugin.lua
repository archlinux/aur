-- Loads the hyprmasq plugin that hyprmasq-plugin-bin has for the running Hyprland: dofile it from hyprland.lua.
-- It never fails the config: without a plugin for this Hyprland, it shows a notification instead.
local ok, err = pcall(function()
    local path = "/usr/lib/hyprmasq/" .. hl.version() .. "/hyprmasq.so"
    local file = io.open(path, "rb")
    if file then
        file:close()
        hl.plugin.load(path)
    else
        hl.notification.create({
            text = "[hyprmasq] Not loaded: hyprmasq-plugin-bin has no plugin for Hyprland " .. hl.version()
                .. " yet. Update it, as with yay -Syu, and restart Hyprland.",
            duration = 10000,
            icon = "error",
        })
    end
end)
if not ok then
    print("hyprmasq: " .. tostring(err))
end
