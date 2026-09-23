-- Proton Authenticator helper for the Omarchy panel plugin
-- (package: proton-authenticator-omarchy-helper).
--
-- Proton's windows open floating and centered, like Omarchy's other password
-- managers. The sign-in window ("Log in" / "Sign up") gets a taller card that
-- fits Proton's hosted sign-in page without scrolling.
--
-- They are also hidden from screen sharing and screenshots, because they show
-- 2FA secrets. To take a screenshot on purpose (for docs), allow capture, then
-- reload Hyprland and reopen the window:
--   omarchy-toggle proton-authenticator-screen-share on && hyprctl reload
-- and turn it back off the same way with "off". The setting only affects
-- windows opened after the reload.
local paths = require("default.hypr.paths")

local function toggle_enabled(name)
  -- Same flag location omarchy-toggle writes.
  local file = io.open(paths.home .. "/.local/state/omarchy/toggles/" .. name, "r")
  if file then
    file:close()
    return true
  end
  return false
end

local allow_capture = toggle_enabled("proton-authenticator-screen-share")

o.window("^proton-authenticator-omarchy-helper$", {
  float = true,
  center = true,
  size = { 875, 600 },
  no_screen_share = not allow_capture,
})

o.window({ class = "^proton-authenticator-omarchy-helper$", title = "^(Log in|Sign up)$" }, {
  size = { 560, 760 },
})
