# Mutter 49.3 + render-source fix (NVIDIA Wayland)

Mutter 49.3 with the **render-source** workaround for “Poor desktop frame rate in Nvidia Wayland sessions” ([LP #2081140](https://bugs.launchpad.net/bugs/2081140), [GNOME MR 4725](https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4725)). Provides **libmutter-17.so** — compatible with current gnome-shell and GDM.

**What this is:** It’s a **workaround for an NVIDIA driver/GBM issue**, not a bug fix in mutter. On nvidia-drm, `gbm_surface_lock_front_buffer()` can block while the GPU is still rendering (GBM doesn’t require it to be non-blocking). That blocking causes poor frame rate. The workaround: mutter defers calling `lock_front_buffer` until the GPU has signalled completion (via the sync fd), so it avoids blocking. The change lives in mutter but works around nvidia-drm (and possibly other bespoke GBM implementations).

**Patches:**  
- `render-source-lp2081140-49.3.patch` — backports Daniel van Vugt’s four render-source commits (defer front-buffer acquisition, GPollFD frame helpers, is_nvidia rename, render source signalling GL completion).  
- `fix-build-49.patch` — forward declaration and `COGL_WINSYS_FEATURE_SYNC_FD` in Cogl so the backport builds on 49.3.

---

## What to keep (to redo everything)

Keep this directory with at least:

| Item | Purpose |
|------|--------|
| **PKGBUILD** | Build recipe; `makepkg` fetches mutter + gvdb from git |
| **render-source-lp2081140-49.3.patch** | Render-source backport onto 49.3 |
| **fix-build-49.patch** | Build fixes (forward decl + COGL_WINSYS_FEATURE_SYNC_FD) |
| **built-pkgs/** | Optional: built `.pkg.tar.zst` for reinstall without rebuilding |

You can delete **built-pkgs/** if you don’t need to reinstall from cache; you can always rebuild with the steps below.

---

## Build from scratch

From this directory:

```bash
cd /home/g/setup/mutter-49-render-source
makepkg -sf
```

- `-s` installs build dependencies if needed  
- `-f` forces rebuild (ignores existing packages)

This will:

1. Clone mutter from GNOME at tag **49.3** and gvdb
2. Apply `render-source-lp2081140-49.3.patch` then `fix-build-49.patch`
3. Build and produce: `mutter-render-source-49.3-3-x86_64.pkg.tar.zst` (single package; no devkit or docs).

After building, the `.pkg.tar.zst` file is in the current directory; you can move it into `built-pkgs/` for tidiness.

---

## Install (first time or after rebuild)

1. **Ignore repo mutter** so `pacman -Syu` doesn’t overwrite your build:

   Edit `/etc/pacman.conf` and under `[options]` add:

   ```
   IgnorePkg = mutter
   ```

2. **Install the built package** (run from the directory that contains the `.pkg.tar.zst` file — either repo root or `built-pkgs/`):

   ```bash
   cd /home/g/setup/mutter-49-render-source
   sudo pacman -U mutter-render-source-49.3-3-x86_64.pkg.tar.zst
   ```

3. **Relog or reboot** so the new compositor is used (Wayland session starts mutter at login).

4. **Confirm** (optional):

   ```bash
   pacman -Q mutter
   # Should show: mutter-render-source 49.3-3
   ```

---

## Reinstall from built package (no rebuild)

If you still have the `.pkg.tar.zst` file (e.g. in `built-pkgs/`):

```bash
cd /home/g/setup/mutter-49-render-source/built-pkgs
sudo pacman -U mutter-render-source-49.3-3-x86_64.pkg.tar.zst
```

Then relog or reboot.

---

## Revert to repo mutter

To go back to the distro’s mutter:

1. **Remove IgnorePkg**  
   Edit `/etc/pacman.conf` and delete or comment out the line:
   ```
   IgnorePkg = mutter
   ```

2. **Reinstall repo mutter** (this replaces mutter-render-source with the official package):
   ```bash
   sudo pacman -S mutter
   ```

3. **Relog or reboot** so the session uses the repo mutter.

After this, `pacman -Q mutter` will show the repo package (e.g. `mutter 49.3-1` from CachyOS/Arch).

---

## Publishing to AUR

To publish this package to the [Arch User Repository](https://aur.archlinux.org/):

1. **Set maintainer in PKGBUILD**  
   Replace the placeholder at the top:
   ```text
   # Maintainer: Your Name <yourname at domain dot tld>
   ```

2. **Create the AUR repo** (if it doesn’t exist yet):
   ```bash
   git clone ssh://aur@aur.archlinux.org/mutter-render-source.git aur-push
   cd aur-push
   ```
   If the package is new, you get an empty repo. Copy into it: `PKGBUILD`, `.SRCINFO`, `render-source-lp2081140-49.3.patch`, `fix-build-49.patch`, `LICENSE`, and optionally `README.md`.

3. **Regenerate .SRCINFO** after any PKGBUILD change (version, deps, etc.):
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. **Commit and push** (AUR only accepts the `master` branch):
   ```bash
   git add PKGBUILD .SRCINFO render-source-lp2081140-49.3.patch fix-build-49.patch LICENSE README.md
   git commit -m "Initial release"   # or your message
   git push
   ```

5. **AUR requirements** (already done in this tree):
   - `PKGBUILD` with at least `pkgname`, `pkgver`, `pkgrel`, `arch`; maintainer comment at top.
   - `.SRCINFO` generated from that PKGBUILD.
   - Checksums: git sources use `SKIP` in `b2sums`; patch files have real b2sums.
   - `LICENSE` (0BSD) for the package sources so the package is eligible for [TU promotion](https://wiki.archlinux.org/title/AUR_submission_guidelines#Rules_of_submission) if desired.

---

## References

- Bug: [LP #2081140 – Poor desktop frame rate in Nvidia Wayland sessions](https://bugs.launchpad.net/bugs/2081140)
- Upstream MR: [GNOME mutter !4725](https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4725)
- Fix branch: [vanvugt/mutter `render-source`](https://gitlab.gnome.org/vanvugt/mutter/-/commits/render-source)
