-- ============================================================================
-- hyprland-hud-rules.lua
-- Layout and Window Rules for hypr-audio-hud
-- Add this to your user rules file (e.g., ~/.config/hypr/hyprland/rules.lua)
-- ============================================================================

hl.window_rule({
    -- Explicitly target the custom window class assigned by Ghostty
    match = { class = "audio-recorder" },
    
    -- Force the window to spawn silently on a private workspace 
    -- Change "9" to your preferred workspace number or name (e.g., "name:Recording")
    workspace = "9", 
    
    -- Prevent the terminal from snapping into a standard tiling grid layout
    float = true,
    
    -- Establish tight, widget-like geometry for the HUD overlay
    size = { 400, 230 },
    
    -- Center the floating translucent box directly on your active display monitor
    center = true,
    
    -- Instantly pull keyboard and layout attention to the window upon launch
    focus_on_activate = true
})
