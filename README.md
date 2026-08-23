# AUR Local Test

Use this directory to test the Arch package locally before publishing anything to AUR.

## Install With Paru

From the repository root:

```bash
paru -Bi packaging/aur
```

Or from inside this directory:

```bash
cd packaging/aur
paru -Bi .
```

`paru -B` builds from a local PKGBUILD directory, and `-i` installs the package after the build succeeds.

## Install Without Paru

```bash
cd packaging/aur
makepkg -si
```

## Remove It

```bash
sudo pacman -Rns codex-native
```

## Notes

- This package is currently named `codex-native-git` because it pulls the native host source from the GitHub repository directly.
- The installed binary is `codex-native`.
- The launcher entry is `codex-native.desktop`.
- The package downloads the pinned official Codex macOS bundle and extracts the frontend locally during package build.
- On Wayland, the launcher defaults `WEBKIT_DISABLE_DMABUF_RENDERER=1`.
- To refresh the pinned upstream frontend version from the main repo, run `./scripts/bump-codex-frontend.sh --latest` from the repository root.
- To publish the same packaging files into the AUR git repo, use `./scripts/sync-aur-repo.sh /path/to/aur-repo` or configure the GitHub Actions workflow with an `AUR_SSH_PRIVATE_KEY` secret.

## Stable Package Later

Once local testing is clean, the proper next step for a stable AUR package named `codex-native` is:

1. Tag a release in the main GitHub repository.
2. Point the AUR package at that fixed release tarball.
3. Rename the AUR package from `codex-native-git` to `codex-native`.

That keeps the AUR naming correct and avoids a misleading "stable" package that actually tracks moving Git history.
