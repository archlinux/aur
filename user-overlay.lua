-- cheatengine-bin (Arch Linux): per-user script overlay.
--
-- Cheat Engine resolves its content directory from the executable's real
-- path (/proc/self/exe), so the packaged install under /usr/lib/cheatengine
-- must stay read-only and cannot be relocated with symlinks. The one hook CE
-- offers that follows the process working directory instead is main.lua:
-- a main.lua in the CWD is loaded in preference to the packaged one
-- (InitializeLuaScripts in LuaHandler.pas).
--
-- The /usr/bin/cheatengine launcher therefore starts CE with its CWD set to
-- a per-user directory (default ~/.local/share/cheatengine) where this file
-- is symlinked as main.lua, and passes NOAUTORUN so CE's own autorun scan is
-- skipped. This file restores stock startup, then re-runs the autorun scan
-- with user precedence:
--
--   * put your own scripts in <userdir>/autorun/NAME.lua
--   * a user script named like a packaged autorun script replaces it
--   * everything else keeps loading from /usr/lib/cheatengine/autorun
--
-- Like upstream, only files matching *.lua (lowercase, non-recursive) load.

local PKGDIR = '/usr/lib/cheatengine/'
local USER_AUTORUN = 'autorun/'  -- relative to CWD = per-user directory

-- Stock bootstrap: packaged main.lua does require("defines"), which must
-- resolve against the package dir now that the CWD is the user dir.
package.path = package.path .. ';' .. PKGDIR .. '?.lua'
dofile(PKGDIR .. 'main.lua')

local function luaScriptNames(dir)
  local names = {}
  for _, entry in ipairs(getFileList(dir, '*.lua') or {}) do
    local name = entry:match('[^/\\]+$')
    if name:match('%.lua$') then
      names[name] = true
    end
  end
  return names
end

local merged = luaScriptNames(PKGDIR .. 'autorun/')
for name in pairs(luaScriptNames(USER_AUTORUN)) do
  merged[name] = true
end

local sorted = {}
for name in pairs(merged) do
  sorted[#sorted + 1] = name
end
table.sort(sorted, function(a, b) return a:lower() < b:lower() end)

for _, name in ipairs(sorted) do
  local path = USER_AUTORUN .. name
  local probe = io.open(path, 'r')
  if probe then
    probe:close()
  else
    path = PKGDIR .. 'autorun/' .. name
  end
  local ok, err = pcall(dofile, path)
  if not ok then
    -- mirrors upstream's per-script error dialog; later scripts still load
    showMessage(name .. ' error:' .. tostring(err))
  end
end
