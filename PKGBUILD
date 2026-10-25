# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-album-shuffle
pkgver=1.1.0
pkgrel=1
pkgdesc="Continuous album shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Album-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4fcac03e9788895cffe16697eb5e22c2656f6b4b451124f1d74019e55fe0edf')

package() {
    cd "${srcdir}/Rhythmbox-Album-Shuffle-${pkgver}"
    install -Dm644 albumshuffle/albumshuffle.py "${pkgdir}/usr/lib/rhythmbox/plugins/albumshuffle/albumshuffle.py"
    install -Dm644 albumshuffle/albumshuffle.plugin "${pkgdir}/usr/lib/rhythmbox/plugins/albumshuffle/albumshuffle.plugin"
    install -Dm644 albumshuffle/album-shuffle.svg "$pkgdir/usr/lib/rhythmbox/plugins/albumshuffle/album-shuffle.svg"
}
