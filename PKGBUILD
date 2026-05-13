# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=26.05.05
pkgrel=2
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.tar.gz::https://downloads.dfagaming.nl/PKHeX-${pkgver}.tar.gz"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('1346612034787f472b89d671f6ef5c2b05618e7828ec7c26f8e1ace39953a13c'
            '71763d9e17617b8e3ad5c3bed88bc037837dd2b7e6f2837ac6f2a7db0b2e28d7'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'aa7d55c6d05a79671d38f8c4133b1fbf01d5106200d97c47658e78421e62b0d4')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.tar.gz" "${pkgdir}/usr/share/pkhex/PKHeX.tar.gz"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
