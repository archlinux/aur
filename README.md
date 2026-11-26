# macos-sequoia-sound-theme

KDE Plasma / freedesktop sound theme made from macOS Sequoia 15.8.3 (24H241) system sounds.
The repository holds only packaging scripts; the sounds are Apple's (see `NOTICE.txt`) and are
range-read from Apple's OTA image during `makepkg`, then converted to Ogg Vorbis.

- Theme: `/usr/share/sounds/macos-sequoia/` (`index.theme`, `stereo/<event name>.oga`).
- The event-to-sound mapping is the `EVENTS` table in `extract_sounds.py`. Events macOS has no
  sound for (battery, login/logout, power unplug, ...) fall back to `ocean`, then `freedesktop`.
  `ocean-sound-theme` is a hard dependency: libcanberra discards a theme whose inherited theme is
  missing. libcanberra also caches lookups, so test changes with a fresh `XDG_CACHE_HOME`.
- `alerts/` has the 14 macOS alert sounds under their current names (Boop, Breeze, ...).

Moving to a newer macOS means updating `OTA_URL`, `OTA_SIZE` and the payload numbers and SHA-256
values in `extract_sounds.py`.
