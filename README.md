# genesis-rpg-bin

AUR-Paket für **[Genesis](https://www.rpgframework.de)** – eine Software zur Verwaltung von Rollenspiel-Charakteren (Splittermond, Space 1889 u. a.).

Das Paket lädt das offizielle Linux-RPM von der Hersteller-Website und packt es lokal in ein Arch-Paket um. Eine eigene JRE ist im RPM gebündelt.

- AUR: <https://aur.archlinux.org/packages/genesis-rpg-bin>
- Upstream: <https://www.rpgframework.de>

## Lizenz

Genesis ist proprietäre Freeware ohne formales Lizenzmodell („No License").
Der Autor (Stefan, rpgframework.de) hat dem Umpaketieren des offiziellen RPM in ein Arch-/AUR-Paket ausdrücklich zugestimmt. Das Paket lädt das unveränderte RPM und verbreitet die Genesis-Daten nicht selbst weiter. Details im installierten Lizenzhinweis (`/usr/share/licenses/genesis-rpg-bin/LICENSE`).

## Bauen / Installieren

```bash
makepkg -si        # baut und installiert
# oder via AUR-Helper:
paru -S genesis-rpg-bin
```

## Version aktualisieren (Maintainer)

Bei neuer Upstream-Version:

```bash
# 1. Version anheben
sed -i 's/^pkgver=.*/pkgver=7.0.6/' PKGBUILD     # oder von Hand
# pkgrel ggf. auf 1 zurücksetzen

# 2. Neue Prüfsumme der Quelldatei ziehen
updpkgsums                                        # aus pacman-contrib

# 3. Testbauen (prüft Download, checksum, packaging)
makepkg -f
namcap PKGBUILD *.pkg.tar.zst                     # erwartetes Rauschen s. u.

# 4. .SRCINFO regenerieren
makepkg --printsrcinfo > .SRCINFO

# 5. Committen und zu beiden Remotes pushen
git add PKGBUILD .SRCINFO
git commit -m "genesis-rpg-bin <neue-version>"
git push origin master      # GitLab
git push aur master         # AUR
```

### Erwartete namcap-Meldungen (kein Handlungsbedarf)

Da Genesis vorkompilierte Binaries mit gebündelter JRE ausliefert, meldet namcap dauerhaft und korrekterweise:

- `unstripped` / `lacks FULL RELRO` – bewusst so (`options=(!strip !debug)`),
  Fremd-Binaries werden nicht angefasst
- `Dependency java-runtime detected` – **Fehlalarm**, die JRE ist gebündelt
- `Dependency bash` / `glibc` – stecken in `base`, werden nicht gelistet
- `ELF files outside of a valid path ('opt/')` – Standard für `/opt`-Pakete
