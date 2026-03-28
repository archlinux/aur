# AUR Package for GSDB

This directory contains the files needed to publish GSDB to the Arch User Repository (AUR).

## Package Variants

- **PKGBUILD** - Builds from source (recommended for AUR)
- **PKGBUILD-bin** - Pre-built binary package (for faster installation)

## Publishing to AUR

### Prerequisites

1. Create an AUR account at https://aur.archlinux.org/register/
2. Generate an SSH key and add it to your AUR account:
   ```bash
   ssh-keygen -t ed25519 -C "ginkcode@gmail.com"
   # Copy the public key to your AUR account settings
   ```

### First-time Setup

```bash
# Clone the AUR package repository
git clone ssh://aur@aur.archlinux.org/gsdb.git
cd gsdb

# Copy the package files
cp /path/to/gsdb/pkg/aur/PKGBUILD .
cp /path/to/gsdb/pkg/aur/.SRCINFO .
cp /path/to/gsdb/pkg/aur/gsdb.desktop .

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit and push
git add PKGBUILD .SRCINFO gsdb.desktop
git commit -m "Initial upload"
git push
```

### Updating the Package

1. Update the version in `PKGBUILD` and `.SRCINFO`
2. Update checksums if needed:
   ```bash
   updpkgsums
   makepkg --printsrcinfo > .SRCINFO
   ```
3. Commit and push changes

## Local Testing

To test the package locally before publishing:

```bash
cd pkg/aur
makepkg -si
```

This will build and install the package on your local system.

## Binary Package (gsdb-bin)

For the `-bin` variant, you need to:

1. Build the AppImage:

   ```bash
   npm run tauri build -- --bundles appimage
   ```

2. Create a GitHub release with the AppImage

3. Update the download URL in `PKGBUILD-bin`

4. Publish to AUR as `gsdb-bin`
