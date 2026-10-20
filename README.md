# crit.md-bin

This AUR package installs prebuilt [crit](https://github.com/tomasz-tomczyk/crit) binaries for `x86_64` and `aarch64`.
Crit lets you review agent plans, diffs, and web apps in a browser.
The package installs the `crit` command. It does not compile the upstream source.

- [AUR package](https://aur.archlinux.org/packages/crit.md-bin)
- [Upstream releases](https://github.com/tomasz-tomczyk/crit/releases)

## Prerequisites

Use Arch Linux or a compatible environment. Install the build and maintenance tools:

```sh
sudo pacman -S --needed base-devel git just jq nvchecker pacman-contrib namcap
```

The `pacman-contrib` package supplies `updpkgsums`.
Run `makepkg` and `just` as a regular user, not root.
The recipes query GitHub through `nvchecker`, so they require network access.

Clone the AUR repository:

```sh
git clone https://aur.archlinux.org/crit.md-bin.git
cd crit.md-bin
```

## Build and install

Read `PKGBUILD` before you build the package. Then check and build it:

```sh
just check
just build
```

`just check` checks Bash syntax, runs `namcap`, verifies source checksums, and checks `.SRCINFO` for differences.
`just build` runs `makepkg -f` and creates a `.pkg.tar.zst` archive for your host architecture.

To build and install the package instead:

```sh
just install
crit --help
```

`just install` runs `makepkg -fsi`. It uses `sudo` when it needs to install dependencies or the package.
Install `xdg-utils` if you want crit to open reviews in your default browser.

## Bump the package

Start with a clean worktree. Fetch the current AUR history before you make changes:

```sh
git status --short
git pull --ff-only
```

### New upstream release

Check the latest version and apply the bump:

```sh
just print-latest
just bump
```

`.nvchecker.toml` selects the upstream GitHub release and removes the `v` prefix.
`just bump` updates `pkgver`, resets `pkgrel` to `1`, refreshes checksums, and regenerates `.SRCINFO`.
It makes no changes when the current version equals or exceeds the latest version.

For a specific release, edit `pkgver` in `PKGBUILD` and reset `pkgrel` to `1`.
Then run:

```sh
just update-checksums
```

Review the upstream release and source URLs before you accept new checksums.
The checksum recipe downloads sources for both supported architectures.

### Packaging change without a new release

Keep `pkgver` unchanged. Increment `pkgrel` in `PKGBUILD`, then regenerate the metadata:

```sh
makepkg --printsrcinfo > .SRCINFO
```

If you change source files or source URLs, run `just update-checksums` instead.
Never edit `.SRCINFO` by hand.

### Validate the update

```sh
just check
just build
just install
crit --help
git diff --check
git diff -- PKGBUILD .SRCINFO
```

Test each supported architecture on a matching host when possible.
A successful build on one architecture does not test the other binary.

## Push to AUR

You need an AUR account with maintainer access to this package.
Add your SSH public key to your AUR account before you push.

This checkout uses the `aur` remote. Configure it once if your clone uses only `origin`:

```sh
git remote add aur https://aur.archlinux.org/crit.md-bin.git
```

Set its push URL and fetch the current history:

```sh
git remote set-url --push aur ssh://aur@aur.archlinux.org/crit.md-bin.git
git fetch aur
```

Review and commit only the package files. The example derives the version from `PKGBUILD`:

```sh
git add PKGBUILD .SRCINFO
git diff --cached --check
git diff --cached
version=$(bash -c 'source ./PKGBUILD; printf "%s-%s" "$pkgver" "$pkgrel"')
git commit -m "build: update crit.md-bin to $version"
git rebase aur/master
git push aur HEAD:master
```

If the rebase changes package files, repeat the validation steps before you push.
Do not force-push. Do not commit downloaded binaries, build directories, or package archives.
Check the AUR page after the push to confirm the new version.

## Clean build files

```sh
just clean
```

This command removes downloaded sources, package archives, and the `src/` and `pkg/` directories.
