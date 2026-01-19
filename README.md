# How to Update

## New App Version (e.g., 0.3.4 -> 0.3.5)
1. **Update Version**: Edit `PKGBUILD`:
   - Set `pkgver` to the new version (e.g., `0.3.5`).
   - **Reset `pkgrel` to 1**.
   - Update `source` URL if the filename structure changed.

2. **Update Checksums**:
   ```bash
   updpkgsums
   ```

3. **Update .SRCINFO**:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. **Publish**:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to version 0.3.5"
   git push
   ```

## Fix Packaging Only (e.g., 0.3.4-1 -> 0.3.4-2)
*Use this if the app version hasn't changed, but you need to fix the PKGBUILD (e.g., dependencies, install script).*

1. **Increment Release**: Edit `PKGBUILD`:
   - Keep `pkgver` as is.
   - **Increment `pkgrel`** by 1 (e.g., `1` -> `2`).

2. **Update .SRCINFO**:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

3. **Publish**:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Fix PKGBUILD issues"
   git push
   ```
