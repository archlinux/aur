# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=23.08.23
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.exe::https://downloads.dfagaming.nl/PKHeX.exe"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('4b41ce0a74473e281de0b07e6b7a6346952afbd6606d57b71c7599d1c21ec8a7'
            'fca1c591574663e1476fb35ca17ede5eeb792b595ccbf12feefe7d6c0c826ec0'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'ce9fe9dd5c0d3e9632704e5dea78128d5742afa72d5ed2fa4af3df545d1aaff1')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.exe" "${pkgdir}/usr/share/pkhex/PKHeX.exe"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
