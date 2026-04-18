# akia-bin

AUR package for [Akia](https://akiskart.bilgem.tubitak.gov.tr/destek/) — TÜBİTAK's
AKİS smart card application. Binary repack of the upstream `.deb`.

This package **replaces** the older source-based `akia` AUR package.
Pacman / AUR helpers will auto-migrate on the next upgrade via `replaces=('akia')`.

## Why `-bin`?

Upstream ships only a `.deb` (inside a WordPress `.zip`) containing:

- `akia-<ver>.jar` — the main app, built with `Build-Jdk-Spec: 1.8`,
  `Main-Class: controller.Main`.
- `libakisp11.so` — PKCS#11 native, links against `libpcsclite.so.1`.
- A bundled OpenJDK 11 JRE (~140 MB) and the install4j launcher runtime.
- Turkish user-manual PDFs.

`akia-bin` strips the bundled JRE and the install4j launcher, repackaging
the essentials using system Java and Arch conventions.

## Layout

| Path                                      | Purpose                               |
|-------------------------------------------|---------------------------------------|
| `/usr/bin/akia`                           | POSIX launcher wrapper                |
| `/usr/share/java/akia/akia.jar`           | Main application jar (arch-independent) |
| `/usr/lib/akia/libakisp11.so`             | PKCS#11 native library (x86_64)       |
| `/usr/share/applications/akia.desktop`    | Desktop menu entry                    |
| `/usr/share/icons/hicolor/48x48/apps/akia.png` | Icon (extracted from upstream `.ico`) |
| `/usr/share/doc/akia-bin/akia-user-guide.pdf`, `smartcard-technology.pdf` | Turkish user manuals |
| `/usr/share/licenses/akia-bin/LICENSE`    | License notice                        |

The jar (`model.MRegistry`) hardcodes the PKCS#11 library lookup to the
absolute path `/usr/lib/libakisp11.so`. The package ships a pacman-owned
symlink at that path pointing to `/usr/lib/akia/libakisp11.so`, so the real
binary stays namespaced while the jar still finds it. The wrapper also
exports `-Djava.library.path=/usr/lib/akia` as defense-in-depth.

It also `cd`s to `${XDG_DATA_HOME:-$HOME/.local/share}/akia` before `exec java`,
so any runtime writes stay under the user's home.

## Requirements

- `java-runtime>=8`
- `pcsclite` (with `pcscd.socket` enabled: `systemctl enable --now pcscd.socket`)
- `ccid` — USB CCID smart card reader driver
- A supported smart card reader

## Build

```sh
updpkgsums                 # refresh sha256sums
makepkg -si                # build + install
namcap PKGBUILD            # lint sources
namcap akia-bin-*.pkg.tar.zst   # lint built pkg
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
4. Run `updpkgsums` to refresh the `.deb.zip` hash.
5. `makepkg --printsrcinfo > .SRCINFO`.
6. Build + test locally (see *Functional test* below).
7. Commit, push to AUR.

If upstream replaces the `.deb.zip` at the same URL without a version bump,
the sha256 will mismatch — bump `pkgrel` and refresh the hash.

## Functional test

After `makepkg -si`:

1. `systemctl enable --now pcscd.socket`
2. Run `akia` in a terminal; confirm the GUI opens with no
   `UnsatisfiedLinkError` or `ClassNotFoundException`.
3. `pgrep -af 'java.*akia.jar'` should show a single `java` process
   with `-Djava.library.path=/usr/lib/akia` in its argv.
4. Insert a real AKİS card and perform a login / signing flow.
5. `lsof -p <pid> | grep akisp11` should point at
   `/usr/lib/akia/libakisp11.so`.
6. Launch from the DE application menu; the taskbar should group
   correctly (validates `StartupWMClass`).

If `StartupWMClass` is wrong when launching via `java -jar` (versus the
upstream install4j launcher), run `xprop WM_CLASS` on the window and
update `akia.desktop` accordingly.

## Relationship to `akia` (source) AUR pkg

`akia-bin` declares:

```
provides=('akia=<pkgver>')
conflicts=('akia')
replaces=('akia')
```

Users of the former source `akia` package are migrated automatically.

## Reverse dependencies

Other AUR packages depend on `akia`; the `provides=('akia=<pkgver>')` entry
satisfies them transparently:

| Package              | Relation          |
|----------------------|-------------------|
| `eimza`              | hard dependency   |
| `uyap-editor-bin`    | optional (project-specific) |

Verify on a live system with:

```sh
pacman -T akia   # exit 0 means the `akia` dep is satisfied
```


## License

See `LICENSE`. The upstream Akia application is TÜBİTAK proprietary
(terms published on the support page). The packaging scripts in this
repository are MIT-licensed.
