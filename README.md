# macos-sequoia-cursor-theme

XCursor theme (KDE Plasma and other desktops) made from the cursors of macOS Sequoia 15.8.3
(24H241). The repository holds only packaging scripts; the cursors are Apple's (see
`NOTICE.txt`) and are range-read from Apple's OTA image during `makepkg`.

- Installed to `/usr/share/icons/macos-sequoia/`, nominal sizes 24, 30, 36, 48, 72 and 96
  (24 is one pixel per macOS point).
- Arrow, I-beam and the spinning wait cursor are Apple's prerendered bitmaps from
  `SkyLight.framework/.../CursorAsset`; the others are rendered from the vector PDFs of
  `HIServices.framework`, with the hotspot and shadow their `info.plist` describes.
- Cursor names and legacy aliases are in the `VECTORS` and `BITMAPS` tables of
  `extract_cursors.py`. Cursors macOS has no equivalent for fall back to `breeze_cursors`.

Moving to a newer macOS means updating `OTA_URL`, `OTA_SIZE` and the payload numbers and
SHA-256 values in `extract_cursors.py`; the `CursorAsset` table layout is parsed from the
file and may change.
