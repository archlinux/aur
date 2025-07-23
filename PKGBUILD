# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
pkgver=2.18.0
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/"
license=('GPL3')
_filename=Heroic-2.18.0-linux-x64.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher//releases/download/v2.18.0/Heroic-2.18.0-linux-x64.pacman")
noextract=("Heroic-2.18.0-linux-x64.pacman")
sha256sums=(079510c19633a4b7b0afc7650d08e9b346fc7e47ff45dbfc4c3d683ca2e62d53)
options=(!strip)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

