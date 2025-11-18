# Kiro-bin-hardened Security Documentation

## Overview

This document provides comprehensive security information for the `kiro-bin-hardened` package, including hardening features, optional security enhancements, and best practices.

---

## Built-in Hardening Features ✅

### 1. **Strict Permission Management (Voxis Standard)**

```bash
# Directories: 755 (rwxr-xr-x)
find "$pkgdir/opt/kiro" -type d -exec chmod 755 {} +

# Files: 644 (rw-r--r--)
find "$pkgdir/opt/kiro" -type f -exec chmod 644 {} +

# Executables: 755 (rwxr-xr-x)
chmod 755 "$pkgdir/opt/kiro/kiro"

# Chrome-sandbox: 4755 (SUID root - critical for Electron security)
chmod 4755 "$pkgdir/opt/kiro/chrome-sandbox"
```

**Why this matters:**
- Prevents unauthorized modification of application files
- Chrome-sandbox SUID is required for Electron's security model
- Follows principle of least privilege

### 2. **Cryptographic Signature Verification**

```bash
verify() {
    openssl x509 -pubkey -noout -in kiro-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature kiro-signature.bin kiro.tar.gz
}
```

**Why this matters:**
- Ensures package integrity from upstream
- Protects against tampering during download
- Validates authenticity of binaries

### 3. **Enhanced Dependencies**

- `ca-certificates` - SSL/TLS certificate validation
- `xdg-utils` - Proper desktop integration and security

### 4. **Build Protection**

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

# 4. Install Kiro profile
sudo cp /usr/share/apparmor/kiro.apparmor /etc/apparmor.d/kiro

# 5. Load and enforce profile
sudo apparmor_parser -r /etc/apparmor.d/kiro
sudo aa-enforce /etc/apparmor.d/kiro
```

**Verification:**

```bash
# Check profile status
sudo aa-status | grep kiro

# View profile mode
sudo aa-status
```

**Profile Features:**
- Read-only access to `/opt/kiro/`
- User home directory access for workspaces
- Network access for AI features and updates
- Terminal and development tool access
- Denies access to sensitive system files (`/boot`, `/etc/shadow`, `/root`)

---

### Firejail (Application Sandboxing)

**What it does:**
- Creates isolated namespace for Kiro
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
firejail kiro

# With network isolation
firejail --net=none kiro

# With custom profile
firejail --profile=/path/to/kiro.profile kiro
```

**Create custom profile:**

```bash
# ~/.config/firejail/kiro.profile
include /etc/firejail/default.profile

# Allow home directory access
whitelist ${HOME}

# Network access (required for AI features)
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
  --ro-bind /opt/kiro /opt/kiro \
  --bind $HOME $HOME \
  --dev /dev \
  --proc /proc \
  --tmpfs /tmp \
  /opt/kiro/kiro
```

**Create wrapper script:**

```bash
#!/bin/bash
# ~/.local/bin/kiro-sandboxed

bwrap \
  --ro-bind /usr /usr \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --ro-bind /opt/kiro /opt/kiro \
  --bind $HOME $HOME \
  --dev /dev \
  --proc /proc \
  --tmpfs /tmp \
  --unshare-all \
  --share-net \
  /opt/kiro/kiro "$@"
```

---

## Security Best Practices 📋

### 1. **Keep Kiro Updated**

```bash
# Update via AUR helper
yay -Syu kiro-bin-hardened

# Or manually
cd /path/to/kiro-bin-hardened
git pull
makepkg -si
```

### 2. **Review Workspaces Before Opening**

- Be cautious with untrusted `.kiro-workspace` files
- Review project dependencies before installation
- Use sandboxing for untrusted projects

### 3. **Monitor Security Logs**

```bash
# AppArmor logs
sudo journalctl -u apparmor | grep kiro

# System logs
journalctl -xe | grep kiro
```

### 4. **Principle of Least Privilege**

- Only enable necessary extensions
- Review extension permissions
- Disable unused features

### 5. **Network Security**

- Use firewall rules if needed
- Monitor network connections: `ss -tunap | grep kiro`
- Consider VPN for sensitive work

---

## Threat Model 🎯

### What This Hardening Protects Against:

✅ **Unauthorized file modification**
✅ **Privilege escalation via improper permissions**
✅ **Binary tampering (via signature verification)**
✅ **Excessive system access (via AppArmor/sandboxing)**
✅ **Lateral movement (via namespace isolation)**

### What This Does NOT Protect Against:

❌ **Zero-day vulnerabilities in Electron/Chromium**
❌ **Malicious extensions (user must review)**
❌ **Social engineering attacks**
❌ **Physical access to system**
❌ **Compromised user account**

---

## Compliance Considerations 🏛️

For government agencies and regulated industries:

### Data Sovereignty
- Review AWS terms and data processing locations
- Consider air-gapped deployments for classified work
- Evaluate data residency requirements

### Audit Logging
```bash
# Enable AppArmor audit mode
sudo aa-audit /etc/apparmor.d/kiro

# Monitor all Kiro activity
sudo auditctl -w /opt/kiro -p rwxa -k kiro_access
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
sudo dmesg | grep DENIED | grep kiro

# Generate profile updates
sudo aa-logprof
```

### Firejail Issues

```bash
# Debug mode
firejail --debug kiro

# Check profile
firejail --list
```

### Permission Problems

```bash
# Verify package permissions
pacman -Ql kiro-bin-hardened | grep chrome-sandbox
# Should show: -rwsr-xr-x (4755)
```

---

## Additional Resources 📚

- **Kiro Documentation:** https://kiro.dev/
- **AWS Security:** https://aws.amazon.com/security/
- **AppArmor Wiki:** https://wiki.archlinux.org/title/AppArmor
- **Firejail Documentation:** https://firejail.wordpress.com/
- **Arch Security:** https://wiki.archlinux.org/title/Security

---

## Reporting Security Issues 🚨

If you discover a security vulnerability:

1. **Do NOT open a public issue**
2. Contact package maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
3. For upstream Kiro issues: https://kiro.dev/security
4. For AWS security: https://aws.amazon.com/security/vulnerability-reporting/

---

## License & Legal

This package respects the AWS Intellectual Property License. By using this software, you agree to:
- AWS Customer Agreement: https://aws.amazon.com/agreement/
- AWS IP License: https://aws.amazon.com/legal/aws-ip-license-terms/
- Service Terms: https://aws.amazon.com/service-terms/
- Privacy Notice: https://aws.amazon.com/privacy/
