TITLE:
I made a native Omarchy Shell widget for pomodoro, tasks and site blocking (Omarchy Focus, on AUR)

BODY:
Omarchy 4's plugin system is great, so I rebuilt my focus tool around it. **Omarchy Focus** puts a live pomodoro countdown in the bar. Click it for a panel with:

- a progress ring with pause / resume / stop and break controls
- your next tasks (click one to start a session on it)
- today's goal, the last 7 days and a 12-week heatmap
- a site guard that blocks distracting sites via `/etc/hosts`, asking for your password through Omarchy's own polkit dialog

It follows your Omarchy theme and doesn't poll: the widget reacts to an inotify change file and counts down locally, so it costs nothing while idle. There's also a Textual TUI and a CLI (`omarchy-focus stats` draws a heatmap and your peak focus hours in the terminal).

Bar controls: click = panel, right-click = start/pause, middle-click = site guard. Keybinding: `omarchy-shell omarchy-focus toggle`.

**Install**

    yay -S omarchy-focus
    omarchy-focus widget install

or from source: `git clone https://github.com/talhacaglar/omarchy-focus && cd omarchy-focus && ./install.sh`

- GitHub: https://github.com/talhacaglar/omarchy-focus
- AUR: https://aur.archlinux.org/packages/omarchy-focus
- Plugin repo (for `omarchy plugin add`): https://github.com/talhacaglar/omarchy-focus-widget
- Release notes: https://github.com/talhacaglar/omarchy-focus/releases/tag/v0.2.0

MIT licensed. Feedback and ideas welcome, especially from people on other themes or multi-monitor setups.

ATTACH: ~/Projects/Clar-Focus/screenshots/demo.gif (and screenshots/panel.png)
