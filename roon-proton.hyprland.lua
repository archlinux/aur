-- Hyprland >= 0.55: tile only Roon's main XWayland window.
-- Load from your Hyprland Lua configuration after requiring `hypr` as `hl`.
hl.window_rule({
    name = "roon-proton-tile",
    match = {
        class = "^steam_app_0$",
        initial_title = "^Roon$",
        xwayland = true,
    },
    tile = true,
})
