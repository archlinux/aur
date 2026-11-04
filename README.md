# fortifone-bin

AUR-Builddateien für FortiFone Softclient for Desktop **8.0.0, Build 67**
(`pkgver=8.0.0.67`), ausschließlich für **x86_64**.

Das `PKGBUILD` lädt das originale Debian-Paket von Fortinet und die von der
Anwendung verlinkte Fortinet-EULA herunter, prüft beide mit SHA-256 und erstellt
daraus ein Arch-Paket. Es wird nichts aus Quellcode kompiliert. Die bereits
heruntergeladene `.deb` im selben Verzeichnis wird von `makepkg` wiederverwendet,
sofern ihr Name und ihre Prüfsumme stimmen.

## Bauen und installieren

Auf einem aktuellen Arch-Linux-System bzw. einer kompatiblen Distribution:

```sh
sudo pacman -S --needed base-devel
makepkg -si
```

`makepkg` als normaler Benutzer ausführen. Die Option `-s` installiert fehlende
Abhängigkeiten über `pacman`; `-i` installiert das fertige Paket. Zum Bauen ohne
Installation `makepkg -s` verwenden.

Danach FortiFone über das Anwendungsmenü oder im Terminal starten:

```sh
fortifone
```

Die Anwendung liegt wie im Original unter `/opt/FortiFone`; `/usr/bin/fortifone`
ist ein Symlink. Desktop-Eintrag, URL-Handler (`fve:`, `fortifone:`, `tel:`) und
Icons werden aus dem Debian-Paket übernommen. Der originale Desktop-Eintrag
verwendet `--ozone-platform=x11`; in einer Wayland-Sitzung wird dafür XWayland
benötigt. Für denselben Startmodus im Terminal:

```sh
fortifone --ozone-platform=x11
```

Die mitgelieferte Electron-Laufzeit bleibt erhalten. `chrome-sandbox` erhält
wie im Debian-Installer den Modus `4755` (im installierten Paket `root:root`).
Die Debian-Installationsskripte werden durch Arch-Paketdateien und die normalen
pacman-Hooks für Desktop-/Icon-Caches ersetzt; eine `.install`-Datei ist nicht
erforderlich.

Optional bietet `libappindicator` die System-Tray-Integration. Für gespeicherte
Zugangsdaten wird ein laufender Secret Service benötigt, beispielsweise
GNOME Keyring. Ein bereits vorhandener kompatibler Dienst kann weiterverwendet
werden.

## Dateien für das AUR

- `PKGBUILD`: Download, Prüfsummen, Abhängigkeiten und Paketierung.
- `.SRCINFO`: mit `makepkg --printsrcinfo` erzeugte AUR-Metadaten.
- `.gitignore`: schließt Downloads und Build-Ausgaben aus.
- `README.md`: diese Anleitung.
- `LICENSE`: 0BSD-Lizenz für die Builddateien; FortiFone selbst bleibt proprietär.

Als Maintainer ist `infabo <der_ulmen@yahoo.de>` eingetragen. In das
AUR-Repository gehören die Builddateien, nicht die `.deb`, die heruntergeladene
EULA, `src/`, `pkg/` oder das fertige Binärpaket.

Die Veröffentlichung erfolgt per Git-Push an
`ssh://aur@aur.archlinux.org/fortifone-bin.git`.

## Aktualisieren

1. `pkgver` an die neue Version samt Build anpassen; bei einer neuen
   Upstream-Version `pkgrel` wieder auf `1` setzen. `_debname` leitet daraus
   das aktuelle URL-Schema `FortiFone_linux_v8.0_b67.deb` ab. Ändert Fortinet
   dieses Schema, muss auch diese Zeile angepasst werden.
2. Neues Debian-Paket, dessen Abhängigkeiten und gegebenenfalls die
   Debian-Installationsskripte prüfen.
3. Prüfsummen nach Prüfung der Downloads erneuern, zum Beispiel mit
   `updpkgsums` aus `pacman-contrib`. Auch die unversionierte EULA-URL kann
   künftig einen anderen Inhalt liefern. Prüfsummenprüfung beibehalten.
4. Metadaten neu erzeugen und das Paket bauen und prüfen:

   ```sh
   makepkg --printsrcinfo > .SRCINFO
   makepkg --cleanbuild
   namcap PKGBUILD "$(makepkg --packagelist)"
   ```

FortiFone ist proprietäre Software (`LicenseRef-Fortinet`). Die von der
Anwendung verlinkte [Fortinet-EULA](https://www.fortinet.com/doc/legal/EULA.pdf)
und die enthaltenen Electron-/Chromium-Lizenzhinweise werden unter
`/usr/share/licenses/fortifone-bin/` zugänglich gemacht.

## Durchgeführte Prüfung

Die Herstellerdatei wurde erneut heruntergeladen und mit der vorhandenen
`.deb` verglichen: Beide haben dieselbe SHA-256-Prüfsumme. Quellprüfung,
`makepkg --cleanbuild`, Erzeugung des Quellarchivs und Validierung des
Desktop-Eintrags waren erfolgreich. Im erzeugten Paket wurden `root:root`
als Eigentümer, der Sandbox-Modus `4755`, die Symlinks und die Lizenzdateien
geprüft. `.SRCINFO` stimmt mit `makepkg --printsrcinfo` überein.

`namcap` meldet bei diesem Herstellerpaket weiterhin:

- ELF-Dateien unter `/opt` und ungestrippte Herstellerbibliotheken. Pfade und
  Binärdateien werden absichtlich beibehalten.
- Den Setuid-Modus des Electron-Sandbox-Helfers, entsprechend dem
  Debian-Installer.
- Eine vermeintlich fehlende Java-Laufzeit: Der mitgelieferte Jabra-Helfer im
  Unterverzeichnis `darwin/` ist eine macOS-Datei, die der Prüfer als Java
  einordnet. Daraus folgt keine Java-Abhängigkeit für Linux.
- Teils vermeintlich unbenutzte Abhängigkeiten. Die zusätzlichen Bibliotheken
  aus den Debian-Metadaten sowie die dynamisch geladene PulseAudio-Bibliothek
  bleiben berücksichtigt; eine ELF-Analyse erkennt solche Nutzungen nicht
  vollständig.

Die Anwendung wurde weder installiert noch gestartet. Anmeldung, Telefonie,
Audio und Headset-Integration wurden nicht funktional getestet.

Referenzen: [PKGBUILD](https://man.archlinux.org/man/PKGBUILD.5),
[makepkg](https://man.archlinux.org/man/makepkg.8),
[FortiFone-Downloads](https://fortivoice-cloud.com/noauth/index.html).
