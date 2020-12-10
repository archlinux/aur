# Maintainer: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
pkgver=0.4.6
pkgrel=1
pkgdesc='A modern looking WebUI for qBittorrent, made with VueJS and ExpressJS'
arch=(any)
url='https://github.com/WDaan/VueTorrent'
license=(GPL3)
optdepends=(
    'qbittorrent: for use with qbittorrent'
    'qbittorrent-nox: for use with qbittorrent-nox'
)
install=qbittorrent-vuetorrent.install
source=(
    "https://github.com/WDaan/VueTorrent/releases/download/$pkgver/release.zip"
    qbittorrent-vuetorrent.install)
md5sums=('5aa51091616bd3a11795b35d96bdbcf5'
         '96ce85f1cb499e33f788bd9726873231')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
