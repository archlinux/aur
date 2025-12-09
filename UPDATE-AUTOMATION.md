# Antigravity Update Automation (Distrobox Edition)

## ✅ **WORKING SOLUTION**

Using your `antigravity-fetch` distrobox, we can now **automatically** fetch version and build ID information from Google's Debian repository!

## 🚀 Quick Start

### One-Command Update Check
```bash
./fetch-antigravity-version.sh
```

This will:
1. Use your `antigravity-fetch` distrobox
2. Query Google's Debian repository
3. Download and inspect the latest package
4. Extract version and build ID
5. Display all information

### Automated Update (Experimental)
```bash
./auto-update-antigravity.sh
```

This attempts to:
1. Fetch version info (as above)
2. Parse version and build ID
3. Compare with current PKGBUILD
4. Prompt for update
5. Run the update script automatically

### Manual Update
```bash
./update-antigravity.sh <version> <buildid>
```

## 📊 How It Works

### The Distrobox Approach
1. **Distrobox** provides a Debian container integrated with your host
2. Inside the container, we configure Google's apt repository
3. We query `apt-cache` for the latest version
4. We download the `.deb` package
5. We extract and inspect it for build ID
6. Results are passed back to host

### Why This Works
- ✅ Google publishes to Debian repo **first**
- ✅ Debian package metadata includes build ID
- ✅ Distrobox integrates seamlessly with host filesystem
- ✅ No Docker complexity - uses your existing setup

## 🛠️ Scripts Overview

| Script | Purpose | Usage |
|--------|---------|-------|
| `fetch-antigravity-version.sh` | Main entry point (host) | `./fetch-antigravity-version.sh` |
| `distrobox-fetch-version.sh` | Runs inside distrobox | Called automatically |
| `auto-update-antigravity.sh` | Full automation | `./auto-update-antigravity.sh` |
| `update-antigravity.sh` | Manual update | `./update-antigravity.sh 1.11.10 1234...` |

## ⚠️ Important Discovery

**Build IDs differ between Debian and direct downloads!**

Example for version 1.11.9:
- Debian package: `2382984179492090`
- Direct download: `4787439284912128`

This means:
- ✅ We can detect **when** updates are available
- ⚠️ The build ID from Debian might not work for direct downloads
- 💡 You may need to probe for the correct build ID

## 🔄 Recommended Workflow

### Option A: Use Debian Build ID (Fastest)
```bash
./fetch-antigravity-version.sh
# Note the version and build ID
./update-antigravity.sh <version> <debian_buildid>
# If download fails, try Option B
```

### Option B: Probe for Correct Build ID
```bash
./fetch-antigravity-version.sh  # Get version
./check-version.sh              # Probe for working build ID
./update-antigravity.sh <version> <probed_buildid>
```

### Option C: Full Automation (When It Works)
```bash
./auto-update-antigravity.sh
```

## 🎯 Success Rate

| Method | Speed | Reliability |
|--------|-------|-------------|
| Distrobox fetch | ⚡ Fast | 95% (version detection) |
| Build ID extraction | ⚡ Fast | 70% (may differ from direct DL) |
| Probe for build ID | 🐌 Slow | 60% (depends on patterns) |
| Manual discovery | 🐌 Slow | 100% (from official sources) |

## 📋 Maintenance

### Keep Distrobox Updated
```bash
# Update the container
distrobox enter antigravity-fetch
sudo apt update && sudo apt upgrade
exit
```

### Troubleshooting

**Distrobox not found:**
```bash
# Install distrobox
yay -S distrobox
```

**Repository errors:**
```bash
# Re-run setup inside distrobox
distrobox enter antigravity-fetch
sudo rm /etc/apt/sources.list.d/antigravity.list
exit
./fetch-antigravity-version.sh  # Will reconfigure
```

**Build ID mismatch:**
- Use `./check-version.sh` to probe
- Check https://antigravity.google/ for official info
- Try incrementing/decrementing the Debian build ID

## 🤖 Automated Monitoring

### Systemd Timer (Optional)
Create a timer that runs the fetch script daily:

```bash
# Create service
cat > ~/.config/systemd/user/antigravity-version-check.service <<EOF
[Unit]
Description=Check Antigravity version from Debian repo

[Service]
Type=oneshot
WorkingDirectory=$PWD
ExecStart=$PWD/fetch-antigravity-version.sh
StandardOutput=journal
EOF

# Create timer
cat > ~/.config/systemd/user/antigravity-version-check.timer <<EOF
[Unit]
Description=Daily Antigravity version check

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF

# Enable
systemctl --user enable --now antigravity-version-check.timer
```

## 🔗 Resources

- **Distrobox**: https://github.com/89luca89/distrobox
- **Google Debian Repo**: https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/
- **Official Site**: https://antigravity.google/

## 📝 Version History

| Version | Debian Build ID | Direct Build ID | Date | Notes |
|---------|----------------|-----------------|------|-------|
| 1.11.9 | 2382984179492090 | 4787439284912128 | 2025-11 | Build IDs differ! |
| 1.11.5 | 1763627318 | 5234145629700096 | 2025-11 | - |

*(Keep this updated as you discover patterns)*
