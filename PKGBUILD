# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-album-shuffle
pkgver=1.0.0
pkgrel=1
pkgdesc="Continuous album shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Album-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cb07941e5d3c52649153e1b7ce2557ce27b98816a98131dc96e98631097cac1')

package() {
    cd "${srcdir}/Rhythmbox-Album-Shuffle-${pkgver}"
    install -Dm644 albumshuffle/albumshuffle.py "${pkgdir}/usr/lib/rhythmbox/plugins/albumshuffle/albumshuffle.py"
    install -Dm644 albumshuffle/albumshuffle.plugin "${pkgdir}/usr/lib/rhythmbox/plugins/albumshuffle/albumshuffle.plugin"
}
