# lxappearance-labwc

This package is a labwc-focused fork of `lxappearance-obconf` (GTK3 plugin for LXAppearance).

## What changed vs upstream

- Session targeting:
  - works in labwc/Wayland sessions
  - reads/writes `~/.config/labwc/rc.xml`
  - applies changes via `labwc --reconfigure` (fallback: `LABWC_PID` + `HUP`)

- Dependency cleanup:
  - removed runtime dependency on Openbox libraries (`obrender`/`obt`)
  - uses `libxml2` + GLib for XML/config handling

- Stability and UI cleanup:
  - removed legacy preview path that caused Wayland crashes
  - removed non-working preview pane
  - removed non-working inactive OSD font control

- Theme and compatibility improvements:
  - restored theme lookup in `$XDG_DATA_HOME/themes` (for example `~/.local/share/themes`)
  - titlebar button order mapped to labwc layout format (`theme/titlebar/layout`)
  - fixed handling of `N` so window icon remains on the left side

- New labwc settings in `Misc.`:
  - workspace prefix/count/initial workspace/popup time
  - placement policy and cascade offsets
  - switcher OSD style/show/output, preview, outlines
  - resize popup mode and draw-contents
  - titlebar show-title, keep-border, maximized decoration
  - options grouped into thematic subtabs for easier navigation

- Workspace count handling:
  - startup loading prefers `desktops/number` when valid
  - fallback to `desktops@number`
  - saving updates both forms for hybrid config compatibility

## Notes

- Current behavior matches original flow: changes are saved when you press `Apply`.
- Changelog with per-release details is in `CHANGELOG.en.md` and `CHANGELOG.ru.md`.
- Labwc compatibility target: `0.9.6` (workspace, placement, switcher OSD, resize and decoration keys used by this plugin are aligned with `docs/rc.xml.all` from `labwc 0.9.6`).

## Mini test (workspace count parsing)

- Run: `python3 tests/test_desktops_number.py`
- This verifies precedence for reading workspace count from `rc.xml`:
  - prefer `labwc_config/desktops/number`
  - then `labwc_config/desktops@number`
  - fallback to `labwc_config/core/desktops`
  - then recursive fallback

## Smoke test (labwc 0.9.6)

- Run: `python3 tests/smoke_labwc_096.py`
- Optional custom file: `python3 tests/smoke_labwc_096.py --rc ~/.config/labwc/rc.xml`
- Checks that keys used by this plugin exist in labwc 0.9.6 structure (including `windowSwitcher`/`osd` attributes).
