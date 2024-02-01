# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
pkgver=2.12.1
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/"
license=('GPL3')
_filename=heroic-2.12.1.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher//releases/download/v2.12.1/heroic-2.12.1.pacman")
noextract=("heroic-2.12.1.pacman")
sha256sums=(6afd74a04e578e0b40853df56a73a429e5588c9c5b2b6b072dcdbe291c268b17)
options=(!strip)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

