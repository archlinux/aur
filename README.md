# hyprland-presenter

Hyprland with a capture-only layer rule that keeps selected layer-shell
overlays visible on the physical monitor while omitting them from whole-output
screen capture.

## Configuration

Lua config:

```lua
hl.layer_rule({
    name = "presenter-overlay",
    match = {
        namespace = "^mague-rc-overlay$",
    },
    screen_share_mode = "omit",
})
```

Legacy hyprlang config:

```ini
layerrule {
    name = presenter-overlay
    match:namespace = ^mague-rc-overlay$
    screen_share_mode = omit
}
```

The available modes are:

- `normal`: capture the layer normally;
- `black`: replace the layer bounds with the existing privacy mask;
- `omit`: render a clean capture frame without the matching layer.

`omit` currently performs a second compositor scene traversal only while a
matching layer is visible. The physical monitor is unchanged.

## Current scope

The clean omission path supports normal-transform whole-monitor capture.
Region capture, transformed outputs, buffer-size mismatch, and session lock use
the existing black privacy mask as a safe fallback.

## Installation

```sh
yay -S hyprland-presenter
```

The package provides and conflicts with `hyprland`, so it replaces the official
package while installed.
