# minimax-bin-hardened Security Documentation

## Overview

This document provides security information for the `minimax-bin-hardened` package.
This package wraps the MiniMax AI Agent web application in an Electron shell, hardened
for high-security and corporate environments.

---

## Built-in Hardening Features

### 1. Electron Security Defaults

- `contextIsolation: true` -- renderer cannot access Node.js APIs
- `nodeIntegration: false` -- web content is fully sandboxed
- `sandbox: true` -- OS-level process sandboxing via chrome-sandbox

### 2. Chrome-sandbox SUID

```bash
chmod 4755 /opt/minimax/chrome-sandbox
```

Required for Electron's Layer 1 Sandbox. Without this, renderer processes
cannot be sandboxed, making the app LESS secure.

### 3. Build Integrity

- `!strip` -- preserves binary integrity (no post-build modifications)
- `!debug` -- skips debug symbol extraction

### 4. Blake2b Checksums

All source files verified with Blake2b (stronger than SHA256) during `makepkg`.

---

## Verifying Package Integrity

### 1. Verify File Permissions

```bash
# Check chrome-sandbox (Must be SUID root)
ls -l /opt/minimax/chrome-sandbox
# Expected: -rwsr-xr-x 1 root root ...

# Check main binary
ls -l /opt/minimax/minimax
# Expected: -rwxr-xr-x 1 root root ...
```

### 2. Verify AppArmor Status (If Enabled)

```bash
sudo aa-status | grep minimax
```

You should see `minimax` listed in **enforce** mode.

---

## Optional Security Enhancements

### AppArmor (Mandatory Access Control)

Ships with a custom AppArmor profile at `/usr/share/apparmor/minimax.apparmor`.

**Capabilities:**
- **Read-only** access to `/opt/minimax/`
- **Write** access restricted to `~/.config/minimax/`, `~/.cache/minimax/`, `~/.local/share/minimax/`
- **Network** access for HTTPS and DNS only
- **Deny** access to `/boot`, `/etc/shadow`, `/root`, kernel firmware

**Installation:**

```bash
sudo pacman -S apparmor
sudo systemctl enable --now apparmor
sudo cp /usr/share/apparmor/minimax.apparmor /etc/apparmor.d/minimax
sudo apparmor_parser -r /etc/apparmor.d/minimax
sudo aa-enforce /etc/apparmor.d/minimax
```

---

## Reporting Security Issues

If you discover a vulnerability in this **packaging**:

1. **Do NOT open a public issue.**
2. Contact the maintainer: **Markus Maiwald <markus@maiwald.work>**

For the MiniMax service itself, report to MiniMax directly:
- https://www.minimax.io/

---

## License

The Electron wrapper code is licensed under MIT.
The MiniMax AI Agent service is governed by MiniMax's Terms of Service.

**Disclaimer:** This package is an independent effort. It is not an official MiniMax release.
