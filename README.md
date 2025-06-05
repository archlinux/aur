# rtorrent-vi-color package

Since v0.15.2 TUI color support was added to rtorrent base package, which makes the color patch unnecessary.

This commit adds TUI color support: [https://github.com/rakshasa/rtorrent/pull/1350](https://github.com/rakshasa/rtorrent/pull/1350)

However, the `.rtorrent.rc` needs to be updated.

Please remove:

```
# color_active_fg, color_inactive_fg, color_dead_fg, color_finished_fg
# color_active_bg, color_inactive_bg, color_dead_bg, color_finished_bg
# Colors: 0 = black 1 = red 2 = green 3 = yellow 4 = blue 5 = magenta 6 = cyan 7 = white
#color_active_fg=2
#color_inactive_fg=3
#color_dead_fg=1
#color_finished_fg=5
```

And instead use below or your own color config preferences.

```
# Colors: 0 = black 1 = red 2 = green 3 = yellow 4 = blue 5 = magenta 6 = cyan 7 = white

ui.torrent_list.layout.set = "compact"
ui.color.title.set="bold bright white on blue"
ui.color.footer.set="bold bright white on blue"
ui.color.focus.set = reverse
#ui.color.label.set = green
#ui.color.info.set = green
#ui.color.alarm.set = green
ui.color.complete.set = magenta
ui.color.seeding.set = magenta
ui.color.stopped.set = yellow
ui.color.queued.set = blue
ui.color.incomplete.set = red
ui.color.leeching.set = green
ui.color.odd.set = dim
#ui.color.even.set = white
```

# Update 2025-06-04

vi navigation has been implemented in the base rtorrent package with this pr: [https://github.com/rakshasa/rtorrent/pull/1484](https://github.com/rakshasa/rtorrent/pull/1484) and will most likely be included in the v0.15.4 release.

To enable vi navigation please set the following in you rtorrent.rc file: `ui.keymap.style.set = "vi"`

# Future of this package

And with the release of v0.15.4 this package, `rtorrent-vi-color` will be obsolete and in due time removed.
