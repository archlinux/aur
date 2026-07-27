# hyprland-presenter

Adds the `screen_share_mode` effect to Hyprland layer rules.

Lua:

```lua
hl.layer_rule({
    name = "presenter-overlay",
    match = {
        namespace = "^your-overlay$",
    },
    screen_share_mode = "omit",
})
```

Legacy hyprlang:

```ini
layerrule {
    name = presenter-overlay
    match:namespace = ^your-overlay$
    screen_share_mode = omit
}
```

Modes:

- `normal`: capture the layer normally;
- `black`: replace the layer bounds with the existing privacy mask;
- `omit`: omit the layer from capture while keeping it visible on the physical
  monitor.
