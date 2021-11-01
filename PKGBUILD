# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
pkgver=0.13.0
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
sha512sums=('e72e4812e16a00998762935688400d9ff2a9683a82fd84a6b94ed5b30fe16524297bd306abf4e2044527d2c8c266b8e2d8ee06dcc20310fab17c3e954ea667e8'
            'a52cd1793dc31b9a6fc95bfb9378eb9508c1ff2c79107d4d774823d35c0e9befbc8c86a97de023ff7939abeb2ce5511ff9183924658cbf88837db8ef7f2962cf')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
