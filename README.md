# kfilt-bin AUR Package

This repository contains the AUR package files for `kfilt-bin`, a precompiled binary package of [kfilt](https://github.com/ryane/kfilt).

## Testing the Package

### On Arch Linux (native)

If you're on an Arch Linux system, you can test the package directly:

```bash
make build
```

This will run `makepkg` to build the package and verify the PKGBUILD is valid.

To install and test locally:

```bash
makepkg -si
```

### On macOS (Apple Silicon or Intel)

Since the official Arch Linux Docker image doesn't support ARM64, you need to use QEMU emulation:

```bash
# Build the Docker image with x86_64 emulation
make image

# Run the build
make image-build
```

For interactive testing with the test image:

```bash
# Build test image with yay installed
podman build --platform linux/amd64 -f Dockerfile.test -t kfilt-aur-test .

# Run interactively
podman run --platform linux/amd64 --rm -it -v $(pwd):/home/builduser/target kfilt-aur-test
```

## Upgrading to a New Version

When a new version of kfilt is released, follow these steps:

### 1. Download and calculate the SHA256 checksum

```bash
curl -sL "https://github.com/ryane/kfilt/releases/download/v<VERSION>/kfilt_linux_amd64" | sha256sum
```

Replace `<VERSION>` with the new version number (e.g., `1.0.1`).

### 2. Update PKGBUILD

Edit the `PKGBUILD` file and update:
- `pkgver=` to the new version
- `pkgrel=1` (reset to 1 for new versions)
- `sha256sums=` to the checksum from step 1

### 3. Regenerate .SRCINFO

```bash
makepkg --printsrcinfo > .SRCINFO
```

Or use the make target:

```bash
make build
```

### 4. Test the package

Build and test the package using one of the methods above to ensure it works correctly.

### 5. Commit and push

```bash
git add PKGBUILD .SRCINFO
git commit -m "version <VERSION>"
git push
```

## Package Structure

- `PKGBUILD` - The build recipe for the package
- `.SRCINFO` - Package metadata (auto-generated from PKGBUILD)
- `Dockerfile` - Container for building the package
- `Dockerfile.test` - Container with yay for testing installation
- `Makefile` - Convenience targets for building
