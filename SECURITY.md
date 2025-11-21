# Antigravity-bin-hardened Security Documentation

## Overview

This document provides comprehensive security information for the `antigravity-bin-hardened` package. This package is designed for high-security and corporate environments where integrity, least privilege, and auditability are paramount.

---

## 🛡️ Built-in Hardening Features

### 1. Strict Permission Management (Voxis Standard)

We enforce a strict permission model that exceeds standard Arch Linux packaging guidelines to ensure defense-in-depth.

```bash
# Directories: 755 (rwxr-xr-x) - Owner write only
find "$pkgdir/opt/antigravity" -type d -exec chmod 755 {} +

# Files: 644 (rw-r--r--) - Owner write only
find "$pkgdir/opt/antigravity" -type f -exec chmod 644 {} +

# Executables: 755 (rwxr-xr-x)
chmod 755 "$pkgdir/opt/antigravity/Antigravity"

# Chrome-sandbox: 4755 (SUID root)
# CRITICAL: Required for Electron's Layer 1 Sandbox to function correctly.
chmod 4755 "$pkgdir/opt/antigravity/chrome-sandbox"
```

**Security Impact:**
- **Immutability:** Prevents non-root users (and compromised user processes) from modifying application code or injecting malware into the executable path.
- **Least Privilege:** Ensures files are readable by all but writable only by root.

### 2. Enhanced Dependency Chain

- **`ca-certificates`**: Enforced for strict SSL/TLS certificate validation.
- **`xdg-utils`**: Ensures secure and standard desktop integration, preventing custom handler hijacking.

### 3. Build Integrity

- **`!strip`**: We explicitly disable binary stripping to preserve the integrity of signed binaries and internal checksums.
- **`!emptydirs`**: Preserves the exact directory structure expected by the application runtime.

---

## 🔐 Verifying Package Integrity

Trust but verify. We recommend all users verify the installed package permissions and integrity.

### 1. Verify File Permissions

Ensure that critical files have the correct permissions:

```bash
# Check chrome-sandbox (Must be SUID root)
ls -l /opt/antigravity/chrome-sandbox
# Output should look like: -rwsr-xr-x 1 root root ...

# Check main executable (Must be root owned, not writable by user)
ls -l /opt/antigravity/Antigravity
# Output should look like: -rwxr-xr-x 1 root root ...
```

### 2. Verify AppArmor Status (If Enabled)

If you have enabled the optional AppArmor profile:

```bash
sudo aa-status | grep antigravity
```
You should see `antigravity` listed in **enforce** mode.

---

## 🛡️ Optional Security Enhancements

### AppArmor (Mandatory Access Control)

This package ships with a custom AppArmor profile located at `/usr/share/apparmor/antigravity.apparmor`.

**Capabilities:**
- **Read-only** access to the application directory `/opt/antigravity/`.
- **Write** access restricted to standard configuration paths in `$HOME`.
- **Network** access allowed for agentic AI features.
- **Deny** access to sensitive system files (`/boot`, `/etc/shadow`, `/root`, kernel parameters).

**Installation:**

```bash
# 1. Install AppArmor
sudo pacman -S apparmor

# 2. Enable AppArmor service
sudo systemctl enable --now apparmor

# 3. Install and Enforce Profile
sudo cp /usr/share/apparmor/antigravity.apparmor /etc/apparmor.d/antigravity
sudo apparmor_parser -r /etc/apparmor.d/antigravity
sudo aa-enforce /etc/apparmor.d/antigravity
```

---

## 🚨 Reporting Security Issues

If you discover a security vulnerability in this **packaging** (permissions, install scripts, AppArmor profile):

1. **Do NOT open a public issue.**
2. Contact the package maintainer directly: **Markus Maiwald <markus@maiwald.work>**

For vulnerabilities in the **Antigravity application itself**, please report to Google directly:
- https://antigravity.google/security
- https://bughunters.google.com/

---

## License & Legal

This package distributes Google Antigravity under its proprietary license.
By using this software, you agree to Google's Terms of Service and Privacy Policy.

**Disclaimer:** This package is an independent effort to provide a hardened installation of Antigravity. It is not an official Google release.
