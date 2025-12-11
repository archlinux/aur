# AUR Package Submission for scidCommunity

This directory contains the PKGBUILD and related files for submitting scidCommunity to the Arch User Repository (AUR).

## Files

- **PKGBUILD** — The main build recipe for Arch Linux

## Steps to Test and Submit

### 1. Test the Build in Arch Distrobox

First, verify the PKGBUILD works correctly in Arch:

```bash
distrobox enter Arch
cd /path/to/scidCommunity/aur
makepkg -si
```

This will:
- Download the source
- Extract it
- Run `./configure` and `make all`
- Install to system

### 2. Identify Correct Arch Tcl/Tk Package Names

Once in the Arch distrobox, check the actual package names:

```bash
pacman -Ss tcl
pacman -Ss tk
```

Update the `depends=()` and `makedepends=()` arrays in PKGBUILD if needed.

### 3. Fix sha256sum

The PKGBUILD currently has `sha256sums=('SKIP')`. To get the real hash:

```bash
cd /path/to/scidCommunity/aur
wget https://github.com/whelanh/scidCommunity/archive/cee3cc8b96b1476e44547c130e9316de47e9810b.tar.gz
sha256sum cee3cc8b96b1476e44547c130e9316de47e9810b.tar.gz
```

Replace the 'SKIP' in PKGBUILD with the actual hash.

### 4. Validate PKGBUILD Syntax

```bash
cd /path/to/scidCommunity/aur
namcap PKGBUILD
namcap -i <pkgname>-<pkgver>-<pkgrel>-<arch>.pkg.tar.zst
```

(Install `namcap` if needed: `pacman -S namcap`)

### 5. Create AUR Git Repository

Once testing passes:

1. Go to https://aur.archlinux.org/
2. Login with your Arch Linux account
3. Click "Submit a Package"
4. Provide:
   - **Package name**: `scidcommunity`
   - **Initial PKGBUILD submission** or initialize with git

### 6. Submit via Git (After Initial Upload)

```bash
git clone ssh://aur@aur.archlinux.org/scidcommunity.git
cd scidcommunity
cp /path/to/scidCommunity/aur/PKGBUILD .
git add PKGBUILD
git commit -m "Initial commit: scidcommunity 5.1.1"
git push
```

## Next Steps

For future updates:
0. Manually update line 11 in PKGBUILD with the new commit hash from the parent
1. Update the PKGBUILD (change pkgver or pkgrel)
2. Regenerate .SRCINFO: distrobox enter Arch -- bash -c "cd /home/hugh/Downloads/scidCommunity/aur && makepkg --printsrcinfo > .SRCINFO"
3. Commit and push: git commit -am "Update to version X.Y.Z" && git push
