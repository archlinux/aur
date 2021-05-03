# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
pkgver=0.10.0
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
	'beccca5a6c5c56a2fa2048b63d549372b0442b7dc07deee228100bbb5703ea563f2d067b77d8e4fee9043c7257498ccc7f6ad8ba9e804e587e8af37398c9d6c9'
	'a52cd1793dc31b9a6fc95bfb9378eb9508c1ff2c79107d4d774823d35c0e9befbc8c86a97de023ff7939abeb2ce5511ff9183924658cbf88837db8ef7f2962cf'
)

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
