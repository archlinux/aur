1. Update Version
Edit the PKGBUILD and update the pkgver variable to the new release version (e.g., 1.14.0).

2. Automate Checksums
Run updpkgsums. This tool downloads the new files and automatically replaces the old hashes in your PKGBUILD.

```bash
updpkgsums
```
Note: This requires the pacman-contrib package.

3. Sync Metadata
Update the .SRCINFO file to match your PKGBUILD changes.

```bash
makepkg --printsrcinfo > .SRCINFO
```

4. Test the Build (Optional but Recommended)
Verify that the package builds and installs correctly with the new versioned binary naming.

```bash
makepkg -sic
```

5. Cleanup & Deploy
Clean up the downloaded source files and push your changes to the AUR.

```bash
git add PKGBUILD .SRCINFO
git commit -m "Update to v$(grep -oP '(?<=pkgver=).*' PKGBUILD)"
git push
```
