# LM Studio AUR Package Tests

This document outlines the verification steps and tests for the `lmstudio-bin` AUR package.

## Test Inventory

### 1. Icon Resolution & Source Verification
- **Test:** Verify source icons exist in extracted AppImage.
- **Criteria:** 
    - `squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png` (1024x1024) must exist.
    - `squashfs-root/resources/app/.webpack/Icon-512x512.png` (512x512) must exist.
- **Purpose:** Ensure high-quality assets are available for installation.

### 2. Naming Consistency (XDG Standards)
- **Test:** Compare `lmstudio.desktop` Icon field with `PKGBUILD` installation targets.
- **Criteria:** `Icon=lmstudio-bin` in `.desktop` file must match the filename installed to `/usr/share/icons/hicolor/*/apps/`.
- **Purpose:** Prevent broken icons in application launchers.

### 3. Execution Path Linkage
- **Test:** Compare `lmstudio.desktop` Exec field with `PKGBUILD` symlink.
- **Criteria:** `Exec=lm-studio` must match the symlink created in `/usr/bin/`.
- **Purpose:** Ensure the application launches correctly from the desktop entry.

### 4. PKGBUILD Integrity
- **Test:** Run `makepkg --printsrcinfo` and verify checksums.
- **Criteria:** `.SRCINFO` must be up to date with `PKGBUILD`.
- **Purpose:** Ensure AUR submission compatibility.

## Execution Instructions

Run the automated verification script:

```bash
chmod +x verify_system.sh
./verify_system.sh
```

### Manual Regression Check
To manually verify icon mapping:
1. Extract AppImage: `./LM-Studio-*.AppImage --appimage-extract`
2. Check `PKGBUILD` `package()` function for `install` commands.
3. Verify `lmstudio.desktop` contains `Icon=lmstudio-bin`.
