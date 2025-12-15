# LycheeSlicer Update Instructions

## Automatic Update (Recommended)

Run the automated update script that fetches the latest version, builds, and commits:

```bash
./updateToLatest.sh
```

This script will:
1. Fetch the latest version from https://mango3d.io/download-lychee-slicer (extracts from embedded JSON data)
2. Compare with current PKGBUILD version (skips if already up-to-date)
3. Run `./buildAndInstall.sh` with the detected version
4. Commit changes with message format: `X.X.X version`
5. Push to remote repository

## Manual Update

If you prefer to specify the version manually:

```bash
./updateToLatest.sh 7.5.2
```

Or run the build script directly:

```bash
./buildAndInstall.sh 7.5.2
git add PKGBUILD .SRCINFO
git commit -m "7.5.2 version"
git push
```

## What Happens During Update

1. Downloads the .deb package from mango3d CDN
2. Calculates SHA512 checksum
3. Updates PKGBUILD with new version and checksum
4. Generates .SRCINFO
5. Builds the package (.tar.zst)
6. Prompts to install the package
7. Commits and pushes changes

## Checking for Latest Version Manually

Visit: https://mango3d.io/download-lychee-slicer

Current version: 7.5.2
