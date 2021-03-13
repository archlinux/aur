bitwarden desktop PKGBUILD
---
This is the PKGBUILD and its related files for bitwarden desktop client.

## How to update
To prospective maintainers: 
Updating this package is more than just bumping the pkgver. Ideally we should build this package under a similar environment as the official release binaries. There are a few things you should check, from the src:

- The nodejs version to use
  - You can find this information from `.github/workflows/release.yml`
  - Alternatively check `.travis.yml`
  - Once you have the nodejs version, update the `_nodeversion` in PKGBUILD
- The electron version to use
  - Check `package.json` of bitwarden/desktop src. Look for `"electron"` in `devDependencies`. For example, if it's `"electron": "11.1.1",` then you should use electron11 if possible.
  - Check if community repo has this version of electron.
    - If community has the version, great, just use it and be done.
    - If community does not have the version, figure something else out :P maybe point to an AUR electron-bin, or just build it against `electron` and see if it works. (it's a pain and the package may break any time when community updates electron)
    - Update **both** PKGBUILD and `bitwarden.sh` to use the correct electron version.
- Check if desktop `package.json` needs more patching
  - Figure out if the `package.json.patch` still works
- Find the `_jslibcommit`
  - Look at the commit of the `jscommit` submodule, in the `desktop` repo, at the version tag.
  - Copy this commit hash into `_jslibcommit` field in PKGBUILD.
- Update the `pkgver`, `pkgrel`, `sha512sums`, etc, the usual, in PKGBUILD.
