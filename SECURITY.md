# Antigravity-bin-hardened Security Documentation

## Overview

This document provides comprehensive security information for the `antigravity-bin-hardened` package, including hardening features, optional security enhancements, and best practices for Google's Antigravity Agentic Development Platform.

---

## Built-in Hardening Features ✅

### 1. **Strict Permission Management (Voxis Standard)**

```bash
# Directories: 755 (rwxr-xr-x)
find "$pkgdir/opt/antigravity" -type d -exec chmod 755 {} +

# Files: 644 (rw-r--r--)
find "$pkgdir/opt/antigravity" -type f -exec chmod 644 {} +

# Executables: 755 (rwxr-xr-x)
chmod 755 "$pkgdir/opt/antigravity/Antigravity"

# Chrome-sandbox: 4755 (SUID root - critical for Electron security)
chmod 4755 "$pkgdir/opt/antigravity/chrome-sandbox"
```

**Why this matters:**
- Prevents unauthorized modification of application files
- Chrome-sandbox SUID is required for Electron's security model
- Follows principle of least privilege

### 2. **Enhanced Dependencies**

- `ca-certificates` - SSL/TLS certificate validation
- `xdg-utils` - Proper desktop integration and security

### 3. **Build Protection**

- `!strip` - Prevents breaking signed binaries
- `!emptydirs` - Preserves necessary directory structure

---

## Optional Security Enhancements 🛡️

### AppArmor (Mandatory Access Control)

**What it does:**
- Restricts file system access
- Controls network capabilities
- Limits process execution
- Provides defense-in-depth security

**Installation:**

```bash
# 1. Install AppArmor
sudo pacman -S apparmor

# 2. Enable AppArmor in kernel (add to kernel parameters)
# Edit /etc/default/grub and add: apparmor=1 security=apparmor
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 3. Enable AppArmor service
sudo systemctl enable --now apparmor

# 4. Install Antigravity profile
sudo cp /usr/share/apparmor/antigravity.apparmor /etc/apparmor.d/antigravity

# 5. Load and enforce profile
sudo apparmor_parser -r /etc/apparmor.d/antigravity
sudo aa-enforce /etc/apparmor.d/antigravity
```

**Verification:**

```bash
# Check profile status
sudo aa-status | grep antigravity

# View profile mode
sudo aa-status
```

**Profile Features:**
- Read-only access to `/opt/antigravity/`
- User home directory access for projects
- Network access for agentic AI features and updates
- Terminal and development tool access
- Denies access to sensitive system files (`/boot`, `/etc/shadow`, `/root`)

---

### Firejail (Application Sandboxing)

**What it does:**
- Creates isolated namespace for Antigravity
- Restricts system call access
- Provides filesystem isolation
- Network namespace isolation

**Installation:**

```bash
sudo pacman -S firejail
```

**Usage:**

```bash
# Basic sandboxing
firejail antigravity

# With network isolation
firejail --net=none antigravity

# With custom profile
firejail --profile=/path/to/antigravity.profile antigravity
```

**Create custom profile:**

```bash
# ~/.config/firejail/antigravity.profile
include /etc/firejail/default.profile

# Allow home directory access
whitelist ${HOME}

# Network access (required for agentic AI features)
# Comment out for offline work
# net none

# Disable 3D acceleration if not needed
# nodvd
# notv
# novideo
```

---

### Bubblewrap (Lightweight Sandboxing)

**What it does:**
- Minimal overhead sandboxing
- Fine-grained filesystem access control
- Namespace isolation

**Installation:**

```bash
sudo pacman -S bubblewrap
```

**Usage:**

```bash
# Basic wrapper
bwrap \
  --ro-bind /usr /usr \
  --ro-bind /opt/antigravity /opt/antigravity \
  --bind $HOME $HOME \
  --dev /dev \
  --proc /proc \
  --tmpfs /tmp \
  /opt/antigravity/Antigravity
```

**Create wrapper script:**

```bash
#!/bin/bash
# ~/.local/bin/antigravity-sandboxed

bwrap \
  --ro-bind /usr /usr \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --ro-bind /opt/antigravity /opt/antigravity \
  --bind $HOME $HOME \
  --dev /dev \
  --proc /proc \
  --tmpfs /tmp \
  --unshare-all \
  --share-net \
  /opt/antigravity/Antigravity "$@"
```

---

## Security Best Practices 📋

### 1. **Keep Antigravity Updated**

```bash
# Update via AUR helper
yay -Syu antigravity-bin-hardened

# Or manually
cd /path/to/antigravity-bin-hardened
git pull
makepkg -si
```

### 2. **Review Projects Before Opening**

- Be cautious with untrusted projects
- Review dependencies before installation
- Use sandboxing for untrusted code

### 3. **Monitor Security Logs**

```bash
# AppArmor logs
sudo journalctl -u apparmor | grep antigravity

# System logs
journalctl -xe | grep antigravity
```

### 4. **Principle of Least Privilege**

- Only enable necessary extensions
- Review extension permissions
- Disable unused features

### 5. **Network Security**

- Use firewall rules if needed
- Monitor network connections: `ss -tunap | grep antigravity`
- Consider VPN for sensitive work

---

## Threat Model 🎯

### What This Hardening Protects Against:

✅ **Unauthorized file modification**
✅ **Privilege escalation via improper permissions**
✅ **Excessive system access (via AppArmor/sandboxing)**
✅ **Lateral movement (via namespace isolation)**

### What This Does NOT Protect Against:

❌ **Zero-day vulnerabilities in Electron/Chromium**
❌ **Malicious extensions (user must review)**
❌ **Social engineering attacks**
❌ **Physical access to system**
❌ **Compromised user account**
❌ **Malicious AI-generated code (user must review)**

---

## Compliance Considerations 🏛️

For government agencies and regulated industries:

### Data Sovereignty
- Review Google's terms and data processing locations
- Consider air-gapped deployments for classified work
- Evaluate data residency requirements

### Audit Logging
```bash
# Enable AppArmor audit mode
sudo aa-audit /etc/apparmor.d/antigravity

# Monitor all Antigravity activity
sudo auditctl -w /opt/antigravity -p rwxa -k antigravity_access
```

### Mandatory Access Control
- AppArmor profile provides MAC framework
- Can be customized for specific security policies
- Integrates with existing security infrastructure

---

## Troubleshooting 🔧

### AppArmor Denials

```bash
# View denials
sudo dmesg | grep DENIED | grep antigravity

# Generate profile updates
sudo aa-logprof
```

### Firejail Issues

```bash
# Debug mode
firejail --debug antigravity

# Check profile
firejail --list
```

### Permission Problems

```bash
# Verify package permissions
pacman -Ql antigravity-bin-hardened | grep chrome-sandbox
# Should show: -rwsr-xr-x (4755)
```

---

## Additional Resources 📚

- **Antigravity Documentation:** https://antigravity.google/
- **Google Security:** https://safety.google/
- **AppArmor Wiki:** https://wiki.archlinux.org/title/AppArmor
- **Firejail Documentation:** https://firejail.wordpress.com/
- **Arch Security:** https://wiki.archlinux.org/title/Security

---

## Reporting Security Issues 🚨

If you discover a security vulnerability:

1. **Do NOT open a public issue**
2. Contact package maintainer: See PKGBUILD for current maintainer
3. For upstream Antigravity issues: https://antigravity.google/security
4. For Google security: https://bughunters.google.com/

---

## License & Legal

This package distributes Google Antigravity under its proprietary license. By using this software, you agree to Google's terms of service and privacy policy.
