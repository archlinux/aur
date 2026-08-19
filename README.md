# AUR packaging for `allium-tools`

This directory is a **git submodule** of the `allium-tools` monorepo, tracking the AUR
repo at `ssh://aur@aur.archlinux.org/allium-tools.git`. It holds the two files the AUR
serves: `PKGBUILD` and the generated `.SRCINFO`.

The package builds both commands from the release source tarball on GitHub: `allium`, the
Rust CLI, and `allium-lsp`, the language server. A new AUR release is only ever "point at
a newer tag and refresh the checksum" — nothing here needs to change when the code
changes, only when the version does.

## Releasing a new version

Upstream releases are automated (see `docs/releasing.md` in the monorepo); the AUR is not.
It is a manual step, run after the GitHub tag exists.

1. **Find the latest tag.** `git ls-remote --tags --refs https://github.com/juxt/allium-tools | sed 's/.*refs\/tags\///' | sort -V | tail -1`

2. **Bump `pkgver`** in `PKGBUILD` to that version, *without* the leading `v` — the tag is
   `v3.5.3`, `pkgver` is `3.5.3`. Reset `pkgrel` to `1` if it was bumped for a
   packaging-only fix.

3. **Refresh `sha512sums`.** With `pacman-contrib` installed, `updpkgsums` does it in
   place. Otherwise compute it by hand:

   ```bash
   curl -sSL "https://github.com/juxt/allium-tools/archive/refs/tags/v${VER}.tar.gz" | sha512sum
   ```

4. **Regenerate `.SRCINFO`.** It is derived, never hand-edited, and the AUR rejects a push
   whose `.SRCINFO` disagrees with the `PKGBUILD`:

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

5. **Build it once before pushing.** The AUR has no CI, so this is the only thing standing
   between a bad `PKGBUILD` and users. Keep the build artefacts out of the repo:

   ```bash
   BUILDDIR=/tmp/allium-aur PKGDEST=/tmp/allium-aur makepkg -f
   ```

6. **Commit and push.** The commit message on the AUR is conventionally just the version:

   ```bash
   git add PKGBUILD .SRCINFO && git commit -m "3.5.3" && git push
   ```

   Then commit the submodule pointer in the parent repo.

## Packaging-only changes

If the `PKGBUILD` itself changes without the version moving — a new dependency, a fix to
`package()` — bump `pkgrel` instead of `pkgver`, and still regenerate `.SRCINFO`.

## Notes

- **`pkgname` doubles as the tarball directory.** GitHub's archive unpacks to
  `allium-tools-${pkgver}`, which is why `build()` and `package()` can use
  `${pkgname}-${pkgver}` directly. If the repo is ever renamed, that coupling breaks.
- **`provides`** lists binary names, not package names — the package is `allium-tools`,
  the commands it installs are `allium` and `allium-lsp`.
- **`allium-lsp` is a Node script, not a native binary.** esbuild bundles it, and it loads
  `allium_wasm.js` and `allium_wasm_bg.wasm` as siblings of its own realpath. All three go
  to `/usr/lib/allium-lsp/` with a symlink at `/usr/bin/allium-lsp`; installing the script
  on its own yields a server that starts, advertises every capability, and then silently
  reports no diagnostics.
- **Building the server needs the wasm toolchain and the network.** `wasm-pack` generates
  `packages/allium-parser-wasm` from `crates/allium-wasm` before `npm ci` can resolve the
  workspace, hence `rust-wasm`, `wasm-pack` and `binaryen` next to `npm` in `makedepends`.
  `wasm-opt` comes from `binaryen` on `PATH`, but the `wasm-bindgen` CLI is downloaded into
  `~/.cache/.wasm-pack`: it has to match the `wasm-bindgen` crate version exactly, and the
  `wasm-bindgen` package in `extra` tracks a different one. Between that and `npm ci`,
  `build()` needs the network — makepkg permits it, a `--nonetwork` chroot build does not.
- **`nodejs` is a hard dependency for CLI-only users too.** Splitting `allium-lsp` into its
  own pkgname would spare them the runtime dep, but not the build: makepkg builds the
  pkgbase once either way, so the wasm and npm steps would still run.
- **The submodule clones over HTTPS, which is read-only.** `.gitmodules` in the monorepo
  uses `https://aur.archlinux.org/allium-tools.git` so `--recurse-submodules` works for
  people without an AUR account. To push, set the SSH URL locally, once:

  ```bash
  git -C aur remote set-url --push origin ssh://aur@aur.archlinux.org/allium-tools.git
  ```

  `git submodule sync` re-derives `origin` from `.gitmodules`, so re-run this if a push
  that used to work starts failing.
- **Push access is per-maintainer**, keyed by the SSH key registered on your AUR account.
  A push rejected for permissions means your key isn't on the account listed as Maintainer
  in the `PKGBUILD`.
