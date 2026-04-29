function on_spin(ctx)
    if ctx.orientation == "left-up" or ctx.orientation == "right-up" then
        return {
            { action = "exec", args = "wvkbd-mobintl" },
            { action = "togglespecialworkspace" }
        }
    end

    return {
        { action = "exec", args = "killall wvkbd-mobintl" },
        { action = "workspace", args = "+0" }
    }
end