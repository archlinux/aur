local HOME = os.getenv("HOME")
local SCRIPT_PATH = HOME .. "/.config/hypr/script"

function on_spin(ctx)
    local o = ctx.orientation
    local m = ctx.monitor

    if o == "normal" or o == "bottom-up" then
        return { action = "exec", args = SCRIPT_PATH .. "/layout scrolling" }
    end

    if o == "left-up" or o == "right-up" then
        return { action = "exec", args = SCRIPT_PATH .. "/layout scrolling 100%" }
    end

    return nil
end
