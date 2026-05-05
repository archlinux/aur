# lens-shot

```bash
yay -S lens-shot

A lightweight, native Wayland utility for Arch Linux that lets you select a screen region, automatically copy it to your clipboard, and instantly launch a Google Lens reverse-image search in Chromium.

Bypasses strict cross-origin and account verification security walls by cleanly routing image payloads via an anonymous API endpoint.

## Features
* **Region Selection:** Smooth, interactive screen cropping using `slurp`.
* **Clipboard Sync:** Copies the cropped region to `wl-clipboard` in the background.
* **Instant Search:** Uploads the crop securely and opens the results directly in Chromium.
* **Dual-Layer Fail-Safe:** Verifies system dependencies at runtime with clean terminal alerts if anything is missing.

---

## Dependencies

If installed via the AUR, these dependencies will be pulled automatically. If running manually, ensure you have:

* **Compositor Utilities:** `grim`, `slurp`, `wl-clipboard`
* **Python Environment:** `python`, `python-requests`
* **Browser:** `chromium` (Falls back to system default if not found)

Install them via pacman:
```bash
sudo pacman -S grim slurp wl-clipboard python python-requests chromium
