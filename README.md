# AUR packaging: goatak-setup-archbased-git

This directory is a **separate AUR packaging workspace**, ignored by the parent GitHub repository. Its own `.gitignore` excludes build output but deliberately keeps `PKGBUILD` and `.SRCINFO` trackable.

The package installs the upstream setup helper, not the GoATAK server implementation. The existing AUR `goatak` package is a dependency. This is a VCS (`-git`) package that builds from the latest upstream default branch; `pkgver()` derives its version from the commit count and short hash.

## Before publishing

- **Resolve the upstream license.** No license file is currently present. `LicenseRef-Unspecified` is an honest placeholder, not a license grant. The copyright owner must choose and commit a license upstream. Update `license=()` accordingly; `package()` installs an upstream `LICENSE` file when present. Do not submit this draft as a licensed release until that is resolved.
- Add a contact address to the PKGBUILD maintainer comment.
- Push the intended script and documentation changes to GitHub. A build uses GitHub sources, not uncommitted files in the parent checkout.
- Check that the AUR package name is available and review current AUR submission guidelines.
- Build and inspect the package on Arch Linux; metadata and syntax checks alone do not establish a working package.

## Files

- `PKGBUILD`: dependencies, VCS sources, syntax/help checks, and installation rules.
- `.SRCINFO`: generated AUR metadata; regenerate after changing PKGBUILD.
- `.gitignore`: makepkg artifacts and its downloaded source cache.
- `README.md`: this maintainer guide. Keep locally; it is not required in AUR commits.

There is intentionally no `.install` hook or bundled service unit. Installing or upgrading this package must **not** run the setup wizard, generate keys, create users, change firewalls, or start/restart services. The wizard handles those operations only when explicitly invoked.

## Build and verify

Use an ordinary user on Arch Linux with `base-devel` and `git` installed. Install the AUR `goatak` dependency first; `makepkg -s` cannot fetch dependencies from the AUR by itself. Ensure either `sudo` or `opendoas` is available when running the helper.

From this directory:

```bash
makepkg --verifysource
makepkg --cleanbuild --syncdeps --check
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD
namcap ./*.pkg.tar.zst
```

Install `namcap` separately for the lint checks. Review warnings rather than assuming every warning is an error. A clean-chroot build is recommended before submission (install Arch's `devtools` and arrange the AUR `goatak` dependency in the chroot).

Install the inspected package explicitly:

```bash
makepkg --install
```

Installed entry points:

```bash
goatak-setup --help
goatak-setup --enrollment-only
# Intentional full configuration only:
goatak-setup --full
```

`/usr/bin/goatak-setup.sh` is a compatibility symlink, so commands in upstream and generated guides continue to work. Packaged documentation lives in `/usr/share/doc/goatak-setup-archbased-git/`. Run setup as your regular user, not root.

Nginx, WireGuard, certificates, privilege escalation configuration, and the selected init manager must still be configured for the deployment. Optional dependencies do not mean every deployment needs every listed component.

## Publish as a separate AUR repository

After resolving the publication checklist, create an AUR account and register your SSH public key. Initialize **inside `aur/`** so this does not stage files in the parent GitHub repository:

```bash
git init -b master
git remote add origin ssh://aur@aur.archlinux.org/goatak-setup-archbased-git.git
```

If the AUR repository already exists, clone it separately and copy the packaging files into that checkout instead; do not force-push over an existing package history.

Regenerate metadata, stage only the packaging files, inspect, then publish:

```bash
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO .gitignore
git diff --cached --check
git diff --cached
git commit -m 'Initial package for GoATAK setup helper'
git push -u origin master
```

Keep `.SRCINFO` committed even though makepkg can regenerate it. Increment `pkgrel` for packaging-only fixes; reset it to `1` when updating the recorded `pkgver`. For a `-git` package, routine upstream commits do not require an AUR update for users to build the latest source.

## Validation status

PKGBUILD Bash syntax and `makepkg --printsrcinfo` were checked during preparation. The environment's default `/etc/makepkg.conf` was unavailable, so metadata generation used a temporary minimal configuration. A full dependency-resolved package build, `namcap`, clean-chroot checks, installation, and live GoATAK validation remain to be performed on an Arch build host.

References: [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines), [VCS package guidelines](https://wiki.archlinux.org/title/VCS_package_guidelines), [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD).
