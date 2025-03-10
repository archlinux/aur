# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
pkgver=2.16.1
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/"
license=('GPL3')
_filename=Heroic-2.16.1-linux-x64.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher//releases/download/v2.16.1/Heroic-2.16.1-linux-x64.pacman")
noextract=("Heroic-2.16.1-linux-x64.pacman")
sha256sums=(3d81b64f592dea41199489650c6a890248c2de74f73b2afc8036e4c945443848)
options=(!strip)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

