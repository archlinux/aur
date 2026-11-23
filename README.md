# 📦 LocalBell for Arch Linux

This AUR recipe packages the public x86_64 release of [LocalBell](https://github.com/fredjunior54/localbell). It installs the executable, desktop launcher, and icon without configuring startup at login.

## 🔧 Update the package

Register an SSH public key with the AUR account that owns `localbell-bin`. Verify the AUR server host key against the published Arch Linux fingerprints before trusting it. Run these commands from this checkout as a regular user with `base-devel`, Git, curl, jq, and the dependencies in `PKGBUILD` installed:

```bash
./update-localbell-bin.sh --dry-run
./update-localbell-bin.sh
```

The updater checks the remote package and latest stable upstream tag. It waits for the public release archive and SHA-256 digest, verifies the package locally, then commits and pushes if needed. A failed push leaves a verified local commit. Resolve the reported issue and rerun; do not force-push. The first successful push creates the AUR package when the name is available and your account has access.
