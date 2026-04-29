geometry = {
    default = { corner = 32, edge = 8 },
    ["eDP-1"] = { corner = 64, edge = 64 },
    ["DP-1"]  = { corner = 32, edge = 8 }
}

function on_zone(ctx)
    if not ctx.trigger then
        if ctx.zone == "bottom" then
            return { delay = 0, action = "exec", args = "walker" }
        end

        if ctx.zone == "top_left" then
            if ctx.hotkeys.super then
                return { delay = 0, action = "exec", args = "kitty" }
            end
            return { delay = 200, action = "workspace", args = "-1" }
        end

        if ctx.zone == "top_right" then
            return { delay = 200, action = "workspace", args = "+1" }
        end

        if ctx.zone == "top" then
            if ctx.special_workspace == "special" then
                return { delay = 0, action = "exec", args = "kitty" }
            end
            if ctx.monitor == "eDP-1" then
                return { delay = 0, action = "exec", args = "nautilus" }
            end
        end
    end

    if ctx.trigger == "drag" then
        if ctx.zone == "top_left" then
            return { delay = 100, action = "movetoworkspacesilent", args = "-1" }
        end
        if ctx.zone == "top_right" then
            return { delay = 100, action = "movetoworkspacesilent", args = "+1" }
        end
    end

    return nil
end
