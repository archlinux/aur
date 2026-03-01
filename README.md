- `PKGBUILD`: The build script (Update `pkgver` and `sha256sums` here).
- `.SRCINFO`: Metadata for the AUR website (Do not edit manually).
- `ecliypse.desktop`: Standard launcher.
- `ecliypse.nvidia.desktop`: GPU-offload launcher for Nvidia users.

---

## How to Publish a New Version

### 1. Prepare the Binary

- Build app: `bun run tauri build`
- Go to `src-tauri/target/release`
- Ensure the binary is executable: `chmod +x ecliypse`
- Create the tarball: `tar -czvf ecliypse-v(version).tar.gz ecliypse icon.png`
- Upload the `.tar.gz` to your hosting provider.

### 2. Update the AUR Recipe

- Open `PKGBUILD` and update `pkgver` to the new version.
- Update the hashes. You can do this automatically if the files are in the folder:
  `updpkgsums`
  _(Or manually: `sha256sum ecliypse.desktop ecliypse.nvidia.desktop ecliypse-v(version).tar.gz`)_

### 3. Generate Metadata (Crucial)

- Every time you change the PKGBUILD, you MUST sync the SRCINFO:
  `makepkg --printsrcinfo > .SRCINFO`

### 4. Test & Push

- Test the build locally: `makepkg -si`
- If it works, commit and push to Arch:
  ```bash
  git add .
  git commit -m "Update to v1.0.0"
  git push
  ```
