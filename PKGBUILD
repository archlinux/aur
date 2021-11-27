# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='The sleekest looking WebUI for qBittorrent made with Vue.js!'
arch=('any')
url='https://github.com/WDaan/VueTorrent'
license=('GPL3')
optdepends=(
    'qbittorrent: for use with qbittorrent'
    'qbittorrent-nox: for use with qbittorrent-nox'
)
install=qbittorrent-vuetorrent.install
source=(
    "https://github.com/WDaan/VueTorrent/releases/download/v$pkgver/vuetorrent.zip"
    qbittorrent-vuetorrent.install)
sha512sums=('8068fe145c7f974a3ab587feecd1445e2789d335756f549b7b60f2d2c1492c183e04bc98a48a9e4f62c0acc1a1f1968c7cd0a67766e838154ca4b14d4a30fe67'
            'a52cd1793dc31b9a6fc95bfb9378eb9508c1ff2c79107d4d774823d35c0e9befbc8c86a97de023ff7939abeb2ce5511ff9183924658cbf88837db8ef7f2962cf')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
