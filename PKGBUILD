# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=25.02.23
pkgrel=6
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.tar.gz::https://downloads.iusearchbtw.nl/PKHeX.tar.gz"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('cbf129729a8833054a2b23e97bf5a944f6b9de2319ae82f49bef95bed46e30f4'
            'ce31184bfbee19c97fa98d6e043c80b19b9ebd877bf75d0d1ad4aca518e8f059'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'aa7d55c6d05a79671d38f8c4133b1fbf01d5106200d97c47658e78421e62b0d4')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.tar.gz" "${pkgdir}/usr/share/pkhex/PKHeX.tar.gz"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
