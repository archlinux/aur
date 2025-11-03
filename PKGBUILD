# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=25.10.26
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.tar.gz::https://downloads.iusearchbtw.nl/PKHeX-${pkgver}.tar.gz"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('81f764d3416a0d42c3655bdbf02d2fd06ff901eafb1ff83f5bfdaea7f4103c20'
            'b7f1527516381756e8f14534863a57c03d2d8f22bf57afffe84e49b41886accf'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'aa7d55c6d05a79671d38f8c4133b1fbf01d5106200d97c47658e78421e62b0d4')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.tar.gz" "${pkgdir}/usr/share/pkhex/PKHeX.tar.gz"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
