# cosmic-ext-applet-yapcap-bin AUR package

Arch Linux packaging for the upstream YapCap x86_64 prebuilt binary release.

Upstream: <https://github.com/TopiCsarno/yapcap>

## License

The packaging files in this repository are licensed under the 0BSD license. The packaged upstream software remains licensed under MPL-2.0, and its license file is installed by the package.

## Maintenance

Update locally with:

```sh
./scripts/update-pkgbuild
```

Publish the current package files to the AUR with:

```sh
./scripts/publish-aur
```

The publish script expects AUR SSH access to be available in your local environment and uses your configured Git identity for the AUR commit. `AUR_REPO_URL` and `AUR_BRANCH` can be set to override the default AUR remote and branch. `COMMIT_MSG` can be set to override the default commit message.

The GitHub Actions workflow runs daily and can also be triggered manually. It checks the latest upstream GitHub release, updates `pkgver`, resets `pkgrel` to `1`, refreshes the SHA-256 checksum, regenerates `.SRCINFO`, and commits the package metadata when anything changed.

## Dependency mapping

The upstream Debian package lists `libc6`, `libfontconfig1`, `libssl3t64`, `libwayland-client0`, and `libxkbcommon0`. Those map to Arch packages `glibc`, `fontconfig`, `openssl`, `wayland`, and `libxkbcommon`. `gcc-libs` is included because the prebuilt binary directly links `libgcc_s.so.1`.
