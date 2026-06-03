# cosmic-ext-applet-minimon-bin AUR package

Arch Linux packaging for the upstream Minimon prebuilt x86_64 RPM/DEB release.

Upstream: <https://github.com/cosmic-utils/minimon-applet>

## License

The packaging files in this repository are licensed under the 0BSD license. The packaged upstream software remains licensed under GPL-3.0-only.

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

The GitHub Actions workflow runs daily and can also be triggered manually. It checks the latest upstream GitHub release, updates `pkgver`, resets `pkgrel` to `1`, refreshes the SHA-256 checksum, maps dependencies from the upstream RPM or Debian package metadata, regenerates `.SRCINFO`, and commits the package metadata when anything changed.

## Dependency mapping

The upstream Debian package for v1.1.1 does not declare a `Depends` field. The RPM package requires `libc.so.6`, `libm.so.6`, `libgcc_s.so.1`, and `libxkbcommon.so.0`; those map to Arch packages `glibc`, `gcc-libs`, and `libxkbcommon`.
