# archon-appimage

AUR packaging repo for the Archon Linux AppImage release.

## Release source

- Download page: <https://www.archon.gg/download>
- Release assets: <https://github.com/RPGLogs/Uploaders-archon/releases>

## Versioning

This package tracks the upstream GitHub release from `RPGLogs/Uploaders-archon`. Upstream tags look like `v9.0.1`, with the AppImage asset named `archon-v9.0.1.AppImage`. The `PKGBUILD` and `.SRCINFO` are kept checked in and updated in place by automation.

## Validation

`namcap` runs against `PKGBUILD` at the start of every workflow run to catch packaging issues before any update is applied. It checks for missing dependencies, bad permissions, incorrect license declarations, and other AUR guideline violations.

For an AppImage package, `namcap` will produce expected warnings about the AppImage binary not being a standard ELF file and about `fuse2` being unverifiable at static analysis time — these are normal and can be ignored.

You can run it locally with:

```bash
namcap PKGBUILD
```

## Automation

The workflow at `.github/workflows/update-release.yml` runs on an hourly schedule and on manual `workflow_dispatch`. It:

1. Runs `scripts/update-from-release.sh` to fetch the latest release, compute the sha256, and rewrite `PKGBUILD`
2. Regenerates `.SRCINFO` in an Arch Linux container
3. Commits and pushes if anything changed
4. Pushes `PKGBUILD`, `.SRCINFO`, and `README.md` to the AUR if `AUR_SSH_PRIVATE_KEY` is set

The workflow also listens for `repository_dispatch` with event type `archon_release` for immediate triggering.

## Secrets

- `AUR_SSH_PRIVATE_KEY`: if set, the workflow pushes updated packaging files to `ssh://aur@aur.archlinux.org/archon-appimage.git`

## Manual update

```bash
./scripts/update-from-release.sh
makepkg --printsrcinfo > .SRCINFO
```

## Local testing

The workflow can be run locally with [`act`](https://github.com/nektos/act).

```bash
act workflow_dispatch -j update
```

The `.actrc` in the repo configures `act` with `--privileged` (required for Docker-in-Docker in the `.SRCINFO` regeneration step) and `DRYRUN=true`, which skips all `git push` calls so nothing is committed to GitHub or the AUR during local runs.
