# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
pkgver=2.14.1
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/"
license=('GPL3')
_filename=heroic-2.14.1.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher//releases/download/v2.14.1/heroic-2.14.1.pacman")
noextract=("heroic-2.14.1.pacman")
sha256sums=(ccf4213a37da01ed86e8b7d7d6fb9d81611fff9e8cfe7dec6d2da2222847ef9f)
options=(!strip)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

