# Mistral-Vibe-Hardened Security Documentation

## Overview

This document provides comprehensive security information for the `mistral-vibe-hardened` package. This package delivers Mistral's AI coding agent with security hardening suitable for production development environments.

---

## 🛡️ Security Hardening Features

### 1. AppArmor Mandatory Access Control

This package ships with a custom AppArmor profile that enforces least-privilege access:

**Capabilities:**
- **Read-only** access to system Python libraries
- **Write** access restricted to:
  - User configuration: `~/.config/mistral-vibe/`
  - Cache: `~/.cache/mistral-vibe/`
  - Temporary files: `/tmp/`
- **Network** access allowed for Mistral AI API communication
- **Git integration** allowed for repository operations
- **Deny** access to:
  - Sensitive system files (`/boot`, `/etc/shadow`, `/root`)
  - Kernel parameters and memory
  - Capability escalation

**Installation (Auto-configured on package install if AppArmor is present):**

```bash
# Manual installation if needed
sudo cp /usr/share/apparmor/vibe.apparmor /etc/apparmor.d/vibe
sudo apparmor_parser -r /etc/apparmor.d/vibe
sudo aa-enforce /etc/apparmor.d/vibe
```

**Verification:**

```bash
sudo aa-status | grep vibe
```

### 2. Strict File Permissions

All package files are installed with restrictive permissions:
- Executables: `755` (root-owned, world-executable)
- Configuration: `644` (root-owned, world-readable)
- No world-writable files

### 3. Clean Build Process

Unlike packages with sprawling dependency lists in PKGBUILD, this package uses `uv` for a clean, reproducible build process. Dependencies are resolved at build time, reducing the attack surface of the package specification itself.

---

## 🔐 API Key Security

Mistral Vibe requires a Mistral AI API key. **Protect this key as you would any credential.**

### Best Practices:

1. **Never commit API keys to version control**
2. **Restrict config file permissions:**
   ```bash
   chmod 600 ~/.config/mistral-vibe/config.toml
   ```
3. **Use environment variables in CI/CD:**
   ```bash
   export MISTRAL_API_KEY="your-api-key"
   ```

### Data Transmission:

Mistral Vibe sends the following to Mistral AI's servers:
- Code context (files and snippets you're working with)
- Commands and queries to the AI agent
- System context (language, file types, workspace metadata)

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
- https://github.com/mistralai/mistral-vibe/security/advisories

---

## 📊 Comparison to Standard Package

| Feature | mistral-vibe (standard) | mistral-vibe-hardened (this) |
|---------|-------------------------|------------------------------|
| **AppArmor Profile** | ❌ None | ✅ Auto-configured |
| **Security Docs** | ❌ None | ✅ Comprehensive |
| **Post-Install Guidance** | ❌ Basic | ✅ Security-focused |
| **Permission Hardening** | ❌ Default | ✅ Strict |
| **Build Process** | pip/hatch | uv (cleaner) |

---

## ⚖️ License & Legal

This package distributes Mistral Vibe under the **Apache License 2.0**.

**Disclaimer**: This is an independent hardened packaging effort, **not an official Mistral AI release**.

---

**Last Updated**: 2025-12-10  
**Package Version**: 1.0.6-1  
**Maintainer**: Markus Maiwald <markus@maiwald.work>
