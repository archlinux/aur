# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
pkgver=0.11.0
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
sha512sums=(
	'171bf05d2c53bfe1832680b85bb472c7ec6a80a564435a9446e600999732e28c35a28871f31ac9e563ebb4493532216ff8bcb040c541477fc233fcecc14583d7'
	'a52cd1793dc31b9a6fc95bfb9378eb9508c1ff2c79107d4d774823d35c0e9befbc8c86a97de023ff7939abeb2ce5511ff9183924658cbf88837db8ef7f2962cf'
)

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
