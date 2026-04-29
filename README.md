
[Cheese](https://github.com/naregderlevonean/hyprmousetrap/blob/main/Cheese.png)

# hyprmousetrap

A high-performance, DPI-aware hot-corner and edge-action daemon for **Hyprland**, written in Rust. It utilizes a powerful and fully programmable **Lua API**, allowing you to conditionally trigger complex actions when your mouse enters screen corners or edges.




## Features

- **Programmable Logic (Lua)**: Complete control over execution context via Lua scripting.
- **DPI Aware**: Automatic logical coordinate scaling for HiDPI displays.
- **8 Active Zones**: 4 corners and 4 edges (`Top`, `Bottom`, `Left`, `Right`, `TopLeft`, `TopRight`, `BottomLeft`, `BottomRight`).
- **Trigger-based Logic**: Distinguish between simple hovering, window dragging, or clicking.
- **Intent Verification**: Configurable delays with real-time cursor tracking to prevent accidental triggers.
- **Modifier Key Integration**: Ability to read `SUPER`, `SHIFT`, `CTRL`, and `ALT` keys during zone entry.

Plans:

- **Improved Fractional Scaling Support**: Enhancing the coordinate calculation logic to handle complex scaling factors (like `1.666`, etc.) with pixel-perfect precision.




## Installation



### Easiest. Direct via Cargo

```bash
cargo install --git [https://github.com/naregderlevonean/hyprmousetrap](https://github.com/naregderlevonean/hyprmousetrap)
```



### Local. From Source

```bash
git clone [https://github.com/naregderlevonean/hyprmousetrap.git](https://github.com/naregderlevonean/hyprmousetrap.git)
cd hyprmousetrap
cargo build --release
cargo install --path .
```

*(Ensure `~/.cargo/bin` is in your `$PATH`)*



### Arch GNU/Linux. Using an AUR Helper

```bash
yay -S hyprmousetrap-git
```

## Requirements

To use Hotkeys, your user must have permission to read input devices:

```bash
sudo usermod -aG input $USER
```




## Configuration

**Path:** `~/.config/hypr/hyprmousetrap.lua`

Configuration is handled entirely through a Lua script. The daemon calls the `on_zone(ctx)` function whenever a zone interaction is detected, providing a context object.



### The Context Object (`ctx`)

| Property | Type | Description |
| :--- | :--- | :--- |
| `ctx.zone` | string | The active zone (`TopLeft`, `Bottom`, etc.). |
| `ctx.trigger` | `string\|nil` | Manual trigger name (e.g., "drag") or nil for hover. |
| `ctx.monitor` | string | The active monitor name (e.g., "eDP-1"). |
| `ctx.specialWorkspace` | `string\|nil` | Name of the active special workspace. |
| `ctx.hotkeys` | table | Boolean keys: `ctrl`, `alt`, `shift`, `superKey`. |



### Return Value

To trigger an action, the Lua function must return a table containing:

- **delay**: Number of milliseconds to wait (validating the cursor remains in the zone).
- **action**: The Hyprland dispatch action (e.g., "exec", "workspace").
- **args**: Arguments for the action.

Return `nil` to do nothing.




## Example Configuration

```lua
-- Global and Monitor-Specific Geometry
geometry = {
    default = {
        corner = 2,
        edge = 2,
    }
}

-- Custom constants
local WS_SPECIAL = "special:special"
local WS_RADIO   = "special:radio"
local WS_STYLUS  = "special:stylus"

-- The evaluation hook
function on_zone(ctx)
    local zone = ctx.zone
    local ws   = ctx.specialWorkspace

    -- Switch workspaces using hyprnome (Bottom Corners)
    if zone == "BottomLeft" then
        return { action = "exec", args = "hyprnome --previous --no-empty --keep-special" }
    end

    if zone == "BottomRight" then
        return { action = "exec", args = "hyprnome --keep-special" }
    end

    -- Lock screen with 2s delay (Top Right)
    if zone == "TopRight" then
        return { delay = 2000, action = "exec", args = "hyprlock" }
    end

    -- Open app launcher (Top Left)
    if zone == "TopLeft" then
        return { action = "exec", args = "walker" }
    end

    -- Bottom Edge: Context-aware logic
    if zone == "bottom" then
        -- If in a special workspace, just stay there/refresh
        if ws == WS_SPECIAL or ws == WS_RADIO or ws == WS_STYLUS then
            return { delay = 1000, action = "workspace", args = "+0" }
        end
        -- Otherwise, toggle special workspace
        return { delay = 1000, action = "togglespecialworkspace" }
    end

    return nil 
end
```




## Usage



### Daemon Mode (Hover Triggers)

Run the daemon in your `hyprland.conf`:

```anyhow
exec-once = hyprmousetrap
```



### Manual Triggers (Drag/Click)

Integrate with Hyprland mouse bindings. The argument after `hyprmousetrap` is passed to the Lua script as `ctx.trigger`.

```anyhow
bindn = , mouse:272, exec, hyprmousetrap drag
```




## License

This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.
