# Lyvoxa AUR Package (Binary)

This directory contains the PKGBUILD for the `lyvoxa-bin` package on the [Arch User Repository (AUR)](https://aur.archlinux.org/packages/lyvoxa-bin).

## 📦 Package Information

- **Package Name**: `lyvoxa-bin`
- **Type**: Precompiled binary release
- **License**: GPL-3.0
- **Maintainer**: oxyzenq

## 🚀 Installation

### For Arch Linux Users

Install using your favorite AUR helper:

```bash
# Using yay
yay -S lyvoxa-bin

# Using paru
paru -S lyvoxa-bin

# Manual installation
git clone https://aur.archlinux.org/lyvoxa-bin.git
cd lyvoxa-bin
makepkg -si
```

## 🔐 Security Verification

This package includes **triple verification**:

1. **SHA256 Checksum** - Integrity verification
2. **GPG Signature (.asc)** - Authenticity verification
3. **validpgpkeys** - Trusted key whitelist

### GPG Key Import

If you haven't imported the maintainer's public key:

```bash
gpg --keyserver hkps://keys.openpgp.org --recv-keys 0D8D13BB989AF9F0
```

Expected output:
```
gpg: key 0D8D13BB989AF9F0: public key "Rezky Cahya Sahputra (Investor) <with.rezky@gmail.com>" imported
```

## 🤖 Automated Workflow

This package is **automatically synced** from GitHub to AUR using GitHub Actions.

### Workflow Trigger

Any push to `lyvoxa-bin/PKGBUILD` or `lyvoxa-bin/.SRCINFO` automatically:

1. Validates PKGBUILD syntax
2. Regenerates .SRCINFO
3. Commits to AUR repository
4. Pushes to `ssh://aur@aur.archlinux.org/lyvoxa-bin.git`

**Result**: Zero manual maintenance! 🎉

## 📋 PKGBUILD Details

### Source Files

The package downloads from GitHub Releases:
- `lyvoxa-{version}-linux-amd64.tar.gz` - Binary package
- `lyvoxa-{version}-linux-amd64.tar.gz.sha256` - Checksum
- `lyvoxa-{version}-linux-amd64.tar.gz.asc` - GPG signature

### Dependencies

- `glibc` - GNU C Library (runtime)

### Provides & Conflicts

- **Provides**: `lyvoxa-bin`
- **Conflicts**: `lyvoxa`, `lyvoxa-git`

This means you can only have one version installed at a time.

## 🔧 Maintenance

### Updating the Package

1. Edit `PKGBUILD`:
   - Update `pkgver` to new version
   - Increment `pkgrel` if rebuilding same version

2. Generate new `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

3. Commit and push to GitHub:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "chore(aur): update to version X.Y.Z"
   git push
   ```

4. GitHub Actions will automatically sync to AUR! 🚀

### Manual Push to AUR

If you need to push manually:

```bash
# Clone AUR repo
git clone ssh://aur@aur.archlinux.org/lyvoxa-bin.git

# Copy files
cp PKGBUILD .SRCINFO lyvoxa-bin/

# Commit and push
cd lyvoxa-bin
git add .
git commit -m "Update to version X.Y.Z"
git push
```

## 🏗️ Package Structure

After installation:

```
/usr/
├── bin/
│   └── lyvoxa                    # Main binary
└── share/
    ├── doc/lyvoxa-bin/
    │   ├── README.md             # Documentation
    │   └── CHANGELOG.md          # Version history
    └── licenses/lyvoxa-bin/
        └── LICENSE               # GPL-3.0 license
```

## 📚 Resources

- **GitHub Repository**: https://github.com/oxyzenQ/lyvoxa
- **AUR Package**: https://aur.archlinux.org/packages/lyvoxa-bin
- **Releases**: https://github.com/oxyzenQ/lyvoxa/releases
- **Issue Tracker**: https://github.com/oxyzenQ/lyvoxa/issues


## 🎯 AUR Guidelines Compliance

This package follows [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines):

- ✅ Proper maintainer attribution
- ✅ GPL-3.0 license specified
- ✅ `.SRCINFO` included
- ✅ GPG signature verification
- ✅ No binaries in repo (downloaded from source)
- ✅ Provides/Conflicts properly set
- ✅ Clean package() function

## 💡 Philosophy

**Single Source of Truth**: GitHub repository is the master.
**Zero Manual Work**: Automation handles AUR sync.
**Security First**: Triple verification (SHA256 + GPG + validpgpkeys).

> "Maintain once, distribute everywhere" - The AUR automation way.

---

**Maintained with ❤️ by oxyzenq**
**Automated by GitHub Actions** 🤖
