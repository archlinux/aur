# Mistral-Vibe-bin-hardened Security Documentation

## Overview

This document provides comprehensive security information for the `mistral-vibe-bin-hardened` package. This package delivers Mistral's AI coding agent with additional security hardening suitable for production development environments where code integrity, data protection, and auditability are critical.

---

## 🛡️ Built-in Hardening Features

### 1. Binary Distribution Model (Zero-Trust Supply Chain)

Unlike source-based builds, this package uses **pre-compiled binaries** directly from Mistral AI's official GitHub releases:

```
Source: https://github.com/mistralai/mistral-vibe/releases
Verification: SHA256 checksums validated against official release
Distribution: Single static binary (minimal attack surface)
```

**Security Impact:**
- **Reduced Build-Time Attack Surface**: No complex Python dependency resolution or build tooling required
- **Official Binary Validation**: Direct verification against Mistral AI's release artifacts
- **Minimal Dependencies**: Only requires `glibc` (vs. 20+ Python packages in source build)
- **Faster Security Updates**: Binary updates deploy in seconds, not minutes

### 2. Strict Permission Management (Voxis Standard)

We enforce the strictest permission model to ensure defense-in-depth:

```bash
# Application directory: 755 (rwxr-xr-x) - Root ownership only
/opt/mistral-vibe/vibe-acp: 755 (rwxr-xr-x)

# Launcher scripts: 755 (rwxr-xr-x)
/usr/bin/vibe: 755 (rwxr-xr-x)
/usr/bin/vibe-acp: 755 (rwxr-xr-x)
```

**Security Impact:**
- **Immutability**: Prevents non-root users from modifying the agent binary or injecting malicious code
- **Least Privilege**: Application runs with user-level privileges, not elevated permissions
- **Code Integrity**: Protects against tampering and ensures the binary remains in its released state

### 3. Enhanced Dependency Chain

- **`glibc`**: Core system library (required)
- **`git` (optional)**: For version control integration in coding workflows
- **`python` (optional)**: For advanced scripting capabilities

**Security Impact:**
- **Minimal Dependency Graph**: Reduces potential vulnerability surface from transitive dependencies
- **System-Level Dependencies**: Uses vetted, distribution-managed libraries
- **Optional Components**: Advanced features are opt-in, not mandatory

### 4. Build Integrity

- **`!strip`**: Binaries are not stripped, preserving debug symbols and signature integrity
- **Official Release Checksums**: BLAKE2 checksums verified against GitHub release artifacts

---

## 🔐 Verifying Package Integrity

Trust but verify. We strongly recommend all users verify the installation.

### 1. Verify File Permissions

Ensure that critical files have the correct permissions:

```bash
# Check main binary (Must be root owned, not writable by user)
ls -l /opt/mistral-vibe/vibe-acp
# Output should be: -rwxr-xr-x 1 root root ...

# Check launcher scripts
ls -l /usr/bin/vibe /usr/bin/vibe-acp
# Both should be: -rwxr-xr-x 1 root root ...
```

### 2. Verify Binary Integrity

Compare the installed binary against the official release:

```bash
# Get the checksum of the installed binary
b2sum /opt/mistral-vibe/vibe-acp

# Compare with the official GitHub release
curl -sL https://github.com/mistralai/mistral-vibe/releases/download/v1.0.5/vibe-acp-linux-x86_64-1.0.5.zip | b2sum
```

### 3. Verify AppArmor Status (If Enabled)

If you have enabled the optional AppArmor profile:

```bash
sudo aa-status | grep vibe
```

You should see `vibe` listed in **enforce** mode.

---

## 🛡️ Optional Security Enhancements

### AppArmor (Mandatory Access Control)

This package ships with a custom AppArmor profile located at `/usr/share/apparmor/vibe.apparmor`.

**Capabilities:**
- **Read-only** access to the application directory `/opt/mistral-vibe/`.
- **Write** access restricted to:
  - User configuration: `~/.config/mistral-vibe/`
  - Agent data: `~/.mistral-vibe/`
  - Cache: `~/.cache/mistral-vibe/`
  - User projects: `~/` (required for coding agent functionality)
- **Network** access allowed for Mistral AI API communication
- **Git integration** allowed for repository operations
- **Deny** access to:
  - Sensitive system files (`/boot`, `/etc/shadow`, `/root`)
  - Kernel parameters and memory (`/proc/kcore`, `/proc/kmem`)
  - Capability escalation (`CAP_SYS_ADMIN`, `CAP_SYS_MODULE`)

**Installation:**

```bash
# 1. Install AppArmor
sudo pacman -S apparmor

# 2. Enable AppArmor service
sudo systemctl enable --now apparmor

# 3. Install and Enforce Profile
sudo cp /usr/share/apparmor/vibe.apparmor /etc/apparmor.d/vibe
sudo apparmor_parser -r /etc/apparmor.d/vibe
sudo aa-enforce /etc/apparmor.d/vibe
```

**Verification:**

```bash
# Verify the profile is loaded and enforced
sudo aa-status | grep vibe
# Expected output: /opt/mistral-vibe/vibe-acp (enforce)

# Test the agent to ensure it still functions
vibe --setup
```

---

## 🔒 Data Privacy & API Key Management

Mistral Vibe requires a Mistral AI API key to function. **Protect this key as you would any authentication credential.**

### Best Practices:

1. **Never commit API keys to version control**
2. **Use environment variables or secure config files**:
   ```bash
   # Store in user config (recommended)
   vibe --setup
   
   # Or use environment variable
   export MISTRAL_API_KEY="your-api-key"
   ```
3. **Restrict config file permissions**:
   ```bash
   chmod 600 ~/.config/mistral-vibe/config.toml
   ```

### What Data is Transmitted:

Mistral Vibe sends the following to Mistral AI's servers:
- **Code context**: Files and snippets you're working with
- **Commands**: Your queries and instructions to the AI agent
- **System context**: Language, file types, and workspace metadata

**Review Mistral AI's Privacy Policy**: https://mistral.ai/privacy/

---

## 🚨 Reporting Security Issues

### For Packaging Issues (Permissions, AppArmor, Install Scripts):

**Contact the package maintainer directly:**
- **Maintainer**: Markus Maiwald
- **Email**: markus@maiwald.work
- **Do NOT open public issues for security vulnerabilities**

### For Mistral Vibe Application Issues:

**Report to Mistral AI:**
- **GitHub**: https://github.com/mistralai/mistral-vibe/security/advisories
- **Security Contact**: Follow Mistral AI's responsible disclosure process

---

## ⚖️ License & Legal

This package distributes Mistral Vibe under the **Apache License 2.0**.

**Disclaimer**: This package is an independent hardened packaging effort. It is **not an official Mistral AI release**. The package maintainer is not affiliated with Mistral AI.

By using Mistral Vibe, you agree to:
- Mistral AI's Terms of Service: https://mistral.ai/terms/
- Mistral AI's Privacy Policy: https://mistral.ai/privacy/

---

## 📚 Additional Resources

- **Mistral Vibe GitHub**: https://github.com/mistralai/mistral-vibe
- **Mistral AI Documentation**: https://docs.mistral.ai/
- **AUR Package Page**: https://aur.archlinux.org/packages/mistral-vibe-bin-hardened
- **AppArmor Documentation**: https://wiki.archlinux.org/title/AppArmor

---

**Last Updated**: 2025-12-10  
**Package Version**: 1.0.5-1  
**Maintainer**: Markus Maiwald <markus@maiwald.work>
