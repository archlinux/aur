# victus-control-bin

This AUR package repackages the GitHub release archive produced by this repository.

## Release flow

1. Bump `project(version:)` in `meson.build`.
2. Push a matching tag such as `v0.1.0`.
3. GitHub Actions uploads `victus-control-0.1.0-x86_64.tar.zst` and its `.sha256` file to the release.
4. Publish `packaging/aur/victus-control-bin` to the AUR as `victus-control-bin`.

## Notes

- The PKGBUILD currently uses `sha256sums=('SKIP')` so the first release can be published without editing the template before the asset exists.
- If you want stricter verification on AUR, replace `SKIP` with the value from the generated `.sha256` file before publishing.
- Installing or upgrading the package reloads the system D-Bus daemon because this project installs system-bus service and policy files.
