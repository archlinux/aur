# kwin-grayscale-effect (Plasma 6) — Split Packages + User Timers

Implements grayscale on a timer, similar to various phone apps. Should help reducing screen time.

## Install
- Install kwin-grayscale-effect via your favourite AUR helper
- `systemctl --user daemon-reload`

## Usage
```bash
systemctl --user enable enable-grayscale@21:00.timer
systemctl --user enable disable-grayscale@6:00.timer
```

## References
- The kwin script: https://github.com/lliurex/kwin-grayscale-effect/tree/plasma6
- Future implementation: https://invent.kde.org/plasma/plasma-desktop/-/merge_requests/3188