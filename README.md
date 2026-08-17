# akia

AUR package for [Akia](https://akiskart.bilgem.tubitak.gov.tr/destek/) — TÜBİTAK's
AKİS smart card application. Repack of the upstream `.deb`.

This package **replaces** `akia-bin`. Pacman / AUR helpers migrate on install
via `replaces=('akia-bin')`.

Upstream ships only a `.deb` (inside a WordPress `.zip`) containing:

- `akia-<ver>.jar` — the main app, built with `Build-Jdk-Spec: 1.8`,
  `Main-Class: controller.Main`.
- `libakisp11.so` — PKCS#11 native, links against `libpcsclite.so.1`.
- A bundled OpenJDK 11 JRE (~140 MB) and the install4j launcher runtime.
- Turkish user-manual PDFs.

This package does not install the bundled JRE or the install4j launcher.
`prepare()` extracts only the jar, `.so`, icon, and two PDFs. The app runs on
system Java. There is no public source, so the package is named `akia` rather
than `akia-bin` (see
[Nonfree applications package guidelines](https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines#Package_naming)).

## Layout

| Path | Purpose |
|-------------------------------------------|---------------------------------------|
| `/usr/bin/akia` | Wrapper around `/usr/bin/java` |
| `/usr/share/java/akia/akia.jar` | Main application jar |
| `/usr/lib/akia/libakisp11.so` | PKCS#11 native library (x86_64) |
| `/usr/lib/libakisp11.so` | Symlink → `akia/libakisp11.so` |
| `/usr/share/applications/akia.desktop` | Desktop entry (`StartupWMClass=controller-Main`) |
| `/usr/share/icons/hicolor/48x48/apps/akia.png` | 48×48 icon (icotool index 2; upstream ICO named `Akia.png`) |
| `/usr/share/doc/akia/akia-user-guide.pdf`, `smartcard-technology.pdf` | Turkish user manuals |
| `/usr/share/licenses/akia/LICENSE` | License notice |

The jar (`model.MRegistry`) hardcodes PKCS#11 lookup to
`/usr/lib/libakisp11.so`. The symlink is required (upstream `postinst` copied
the `.so` there). `-Djava.library.path=/usr/lib/akia` is for JNA, not that
lookup.

The wrapper also passes
`--add-exports jdk.crypto.cryptoki/sun.security.pkcs11.wrapper=ALL-UNNAMED`
(needed on JRE 17+; accepted on 11; rejected on 8) and `cd`s to
`${XDG_DATA_HOME:-$HOME/.local/share}/akia` so cwd-relative writes stay in the
home directory.

## Requirements

- `java-runtime>=11` (the export flag above is fatal on 8)
- `pcsclite` (enable the daemon: `systemctl enable --now pcscd.socket`)
- `ccid` — USB CCID smart card reader driver
- `hicolor-icon-theme`
- A supported smart card reader

`pcsc-tools` is optional (reader debugging). `icoutils` is a make dependency
(icon extract).

## Build

```sh
updpkgsums                 # refresh b2sums
makepkg -si                # build + install
namcap PKGBUILD            # lint sources
namcap akia-*.pkg.tar.zst  # lint built pkg
```

## Version bump checklist

Upstream publishes each release at a URL that embeds the WP upload year/month:

```
https://akiskart.bilgem.tubitak.gov.tr/wp-content/uploads/sites/33/YYYY/MM/Akia_linux_<X_Y_Z>.deb_.zip
```

For each new release:

1. Update `pkgver` to the new version.
2. Update `_debyear` / `_debmonth` to match the upstream upload path.
   (`_debver` is derived from `pkgver` automatically.)
3. Reset `pkgrel=1`.
4. Run `updpkgsums` to refresh the `.deb.zip` hash (`b2sums` only).
5. `makepkg --printsrcinfo > .SRCINFO`.
6. Build + test locally (see *Functional test* below).
7. Commit, push to AUR.

If upstream replaces the `.deb.zip` at the same URL without a version bump,
the b2sum will mismatch — bump `pkgrel` and refresh the hash.

## Functional test

After `makepkg -si`:

1. `systemctl enable --now pcscd.socket`
2. Run `akia` in a terminal; confirm the GUI opens with no
   `UnsatisfiedLinkError`, `ClassNotFoundException`, or PKCS#11
   `IllegalAccessError` on `sun.security.pkcs11.wrapper`.
3. `pgrep -af 'java.*akia.jar'` should show a single `java` process
   with `--add-exports …sun.security.pkcs11.wrapper=ALL-UNNAMED` and
   `-Djava.library.path=/usr/lib/akia` in its argv.
4. Insert a real AKİS card and perform a login / signing flow.
5. `lsof -p <pid> | grep akisp11` should point at
   `/usr/lib/akia/libakisp11.so` (via `/usr/lib/libakisp11.so`).
6. Launch from the DE application menu; the taskbar should group
   correctly (`StartupWMClass=controller-Main`, measured on `java -jar`).

If grouping is wrong, run `xprop WM_CLASS` on the window and update
`akia.desktop`. Do not reuse the upstream install4j class
(`install4j-controller-Main`); this package does not ship that launcher.

## Relationship to `akia-bin`

`akia` declares:

```
provides=('akia-bin=<pkgver>')
conflicts=('akia-bin')
replaces=('akia-bin')
```

Users of `akia-bin` are migrated when they install `akia`.
`uyap-editor-bin` optionally depends on `akia`.

Verify on a live system with:

```sh
pacman -T akia   # exit 0 means the `akia` dep is satisfied
```

## License

`license=('LicenseRef-proprietary')`. The upstream Akia application is TÜBİTAK
proprietary (terms published on the support page). The packaging scripts in
this repository are MIT-licensed. See `LICENSE`.
