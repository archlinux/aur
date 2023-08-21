# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=23.07.09
pkgrel=2
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.exe::https://downloads.dfagaming.nl/PKHeX.exe"
        "launcher")
sha256sums=('4b41ce0a74473e281de0b07e6b7a6346952afbd6606d57b71c7599d1c21ec8a7'
            'd54568414f5abad0b462f05a523c48b14afb1c44587189dcc497a81b73fe1b27')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.exe" "${pkgdir}/usr/share/pkhex/PKHeX.exe"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
