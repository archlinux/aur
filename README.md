# Lem AUR Build

A complete, production-ready setup for maintaining the [Lem](https://github.com/lem-project/lem) text editor on the Arch Linux AUR. Since the previous AUR package is no longer maintained, this creates a fresh, actively-maintained package.

## What This Is

- ✅ **PKGBUILD** - Uses Lem's precompiled AppImage (fast, reliable)
- ✅ **Docker-based building** - Works on any Linux distro (we're on Debian)
- ✅ **Automated updates** - Checks for new releases and publishes to AUR
- ✅ **Systemd integration** - Optional automated scheduling
- ✅ **Complete documentation** - Step-by-step setup guides

## Quick Links

- **Getting Started**: See [AUR_SETUP.md](AUR_SETUP.md) for submitting to AUR
- **Automation**: See [SYSTEMD_SETUP.md](SYSTEMD_SETUP.md) for automated updates
- **Update Script**: [update.sh](update.sh) - One command to update and publish

## Current Status

- ✅ Package builds successfully with `./build.sh`
- ✅ .SRCINFO generated and committed
- ✅ Ready to publish to AUR

## The Workflow

### 1. Initial Setup (One-Time)

```bash
# Generate SSH key and add to AUR account
ssh-keygen -t ed25519

# Test SSH connection
ssh aur@aur.archlinux.org

# Configure git
git config user.name "Your Name"
git config user.email "your@email.com"

# Add AUR remote
git remote add aur ssh://aur@aur.archlinux.org/lem.git

# Push to AUR (after creating package on AUR website)
git push -u aur main:master
```

See [AUR_SETUP.md](AUR_SETUP.md) for detailed instructions.

### 2. Automated Updates (Optional)

Set up a systemd timer for daily automatic updates:

```bash
sudo ./setup-systemd.sh
```

This will:
- Download the latest Lem release
- Update the PKGBUILD version
- Regenerate .SRCINFO
- Automatically push to AUR

See [SYSTEMD_SETUP.md](SYSTEMD_SETUP.md) for details and customization.

### 3. Manual Updates

To manually check for updates and publish:

```bash
./update.sh
```

## File Structure

```
.
├── PKGBUILD              # AUR package definition
├── .SRCINFO              # AUR metadata (auto-generated)
├── Dockerfile            # Docker environment for makepkg
├── build.sh              # Build script (creates .pkg.tar.zst)
├── update.sh             # Update and publish script
├── setup-systemd.sh      # Systemd timer installer
├── lem-aur-update.{service,timer}  # Systemd unit files
├── AUR_SETUP.md          # AUR submission guide
├── SYSTEMD_SETUP.md      # Systemd timer guide
├── AUTOMATION.md         # Automation options
└── README.md             # This file
```

## How It Works

1. **Package Format**: Uses Lem's official precompiled AppImage (much faster than building from source)
2. **Building**: Docker container with Arch Linux + non-root user (required by AUR)
3. **Publishing**: Git-based workflow with SSH to AUR servers
4. **Automation**: Systemd timers or cron job to check for updates and publish

## Usage

### Build Locally

Test the package builds:

```bash
./build.sh
```

Output goes to `output/lem-*.pkg.tar.zst`

### Update and Publish

Check for new Lem releases and push to AUR:

```bash
./update.sh
```

This script:
1. Fetches latest Lem release
2. Increments package version
3. Generates .SRCINFO
4. Commits to git
5. Pushes to AUR

### Automated Publishing

Set up daily automatic updates:

```bash
# Option 1: Systemd timer (recommended)
sudo ./setup-systemd.sh

# Option 2: Cron job
crontab -e
# Add: 0 2 * * * cd /home/thomas/lem-aur-build && ./update.sh
```

## Requirements

- Docker (for building)
- Git (for version control)
- curl (for downloading)
- AUR account with SSH key (for publishing)

## Getting Help

### First Time Setup

1. Start with [AUR_SETUP.md](AUR_SETUP.md)
2. Follow the SSH key and AUR account steps
3. Create the package on AUR website
4. Push your code as shown in step 5

### Setting Up Automation

See [SYSTEMD_SETUP.md](SYSTEMD_SETUP.md) for:
- Quick setup with one command
- Manual systemd configuration
- Scheduling options (daily, weekly, etc.)
- Monitoring and troubleshooting

### Updating Schedule

Modify [lem-aur-update.timer](lem-aur-update.timer):
- Change `OnCalendar=*-*-* 02:00:00` to your preferred time
- Examples: `03:00:00`, `14:30:00`, `Mon-Fri *-*-* 02:00:00`

### Manual Updates

Edit [update.sh](update.sh) for custom behavior:
- `get_latest_release()` - Change release selection
- `commit_changes()` - Customize commit messages
- Add pre/post hooks in `main()`

## Troubleshooting

### Build fails

```bash
# Rebuild Docker image
docker build --no-cache -t lem-aur-builder .

# Test manually
docker run -it --rm -v $(pwd):/build lem-aur-builder
# Inside: cd /build && makepkg --printsrcinfo
```

### SSH/Git push fails

```bash
# Test SSH
ssh -v aur@aur.archlinux.org

# Check remote
git remote -v

# Manual push
git push aur main:master -v
```

### Docker daemon not running

```bash
sudo systemctl start docker
# or
sudo service docker start
```

### Timer not running

```bash
sudo systemctl status lem-aur-update.timer
sudo journalctl -u lem-aur-update -f
```

## License

The PKGBUILD and scripts in this repository are licensed under the same terms as Lem (MIT).

## Further Reading

- [AUR Submission Guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- [PKGBUILD Manual](https://man.archlinux.org/man/PKGBUILD.5)
- [Systemd Timer Manual](https://www.freedesktop.org/software/systemd/man/systemd.timer.html)
