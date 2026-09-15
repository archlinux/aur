# mxarch-repo

Bootstrap package for the MX Linux Arch repository (`mxarch`), served from
<https://arch.mxrepo.com/>.

Existing MX-Arch installs have no way to reach the repository on their own - a
package that added it would have to come *from* it. This package closes that
gap through AUR, which every MX-Arch install can already use. New installs get
the repository preconfigured from the ISO and do not need it.

## Enabling the repository

    paru -S mxarch-repo
    sudo mxarch-enable
    sudo pacman -Syu

### Without an AUR helper

    sudo pacman -U https://github.com/MX-Linux/mxarch-repo/releases/latest/download/mxarch-repo.pkg.tar.zst
    sudo mxarch-enable
    sudo pacman -Syu

From a GitHub release rather than from `arch.mxrepo.com`, because every file in
the repository has a `.sig` beside it: `pacman -U` from there fetches a
signature made by a key you do not have yet and refuses it as unknown trust. A
release asset has no `.sig`, so pacman finds no signature, the default
`LocalFileSigLevel = Optional` permits the install, and the package brings the
key with it.

The asset is named `mxarch-repo.pkg.tar.zst` with no version, so that URL is
permanent. pacman reads the real version from `.PKGINFO`.

`mxarch-enable` appends the `[mxarch]` section to `/etc/pacman.conf`, keeping a
timestamped backup of the previous file. The section goes last, so the official
repositories keep precedence.

It refuses to do anything in three cases:

- **the signing key is not trusted in the pacman keyring.** This one matters
  most. With `SigLevel = Required`, an enabled repository whose database will
  not verify makes *every* pacman transaction fail - including the one that
  would install the key - so the system needs manual recovery and the error
  says nothing about how. Checking first turns that into a message. Override
  with `--force` if you know what you are doing.
- **`[mxarch]` is already there.** Says so and exits 0; no duplicate section.
- **`pacman.conf` mentions `mxarch` but has no `[mxarch]` section** - a
  commented-out block, an abandoned edit, another section already using the
  mirrorlist. That is an edit the script should not guess at, so it prints the
  section and leaves the file alone.

The install script prints this reminder itself, and stays quiet once `[mxarch]`
is present.

## What it installs

    /usr/share/pacman/keyrings/mxarch.gpg       repository signing key
    /usr/share/pacman/keyrings/mxarch-trusted   its fingerprint and trust level
    /etc/pacman.d/mxarch-mirrorlist             Server = ... (backup=, so edits survive)
    /usr/bin/mxarch-enable                      adds the [mxarch] section to pacman.conf

The install script runs `pacman-key --populate mxarch`, which imports the key and
applies the declared trust - rather than making users run `pacman-key --add` and
`pacman-key --lsign-key` by hand, where a mistyped key id fails confusingly.

`pacman.conf` uses `Include =` rather than a literal `Server =` so the hosting
can move later without every user editing `pacman.conf` again.

## Why enabling is a separate command

`/etc/pacman.conf` belongs to the `pacman` package, and a package should not
edit another package's config as a side effect of being installed. The removal
path is the genuinely risky half: un-appending a section from a file the user
may have edited means `sed` against unknown content, and a botched edit there
breaks all package management, not just this repository.

Run deliberately - by hand, or from a GUI where the user clicked something
labelled "Enable MX Arch repo" - that objection does not apply, because the
config change is the thing being asked for rather than a hidden consequence of
something else. Hence a command the user runs, rather than a `post_install`
that rewrites `pacman.conf` behind them.

## The key expires 2027-05-30

`A220D6ABB427CF38A8C5E560442D90008FE173AE`, the `home:mx-packaging` OBS project
key. When OBS renews it the fingerprint is unchanged but the published key gains
an extended self-signature, so this package needs a refreshed `mxarch.gpg` and a
new `pkgver` around then - otherwise signature checks start failing on installed
systems. Because `mxarch-repo` is also built into the repository itself, that
renewal reaches users through a normal `pacman -Syu`.

## Keyring and mirror list in one package

Deliberate. The usual `-keyring` / `-mirrorlist` split serves repositories with
hundreds of keys and hundreds of mirrors changing on different cadences; `mxarch`
has one key on a four-year expiry and one mirror. If a second mirror ever
appears, splitting then is a normal migration - a new `mxarch-mirrorlist` with
`provides`/`replaces`.

## Removing it

Deletes the key, which breaks updates from `mxarch` while the repository is
still enabled in `pacman.conf`. Remove the `[mxarch]` section too.
