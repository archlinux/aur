# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-album-shuffle
_foldername=albumshuffle
pkgver=1.5.0
pkgrel=1
pkgdesc="Continuous album shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Album-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65b160741278ae692ca69377d309e3f1386e52f4bd768e81f3d2fd8d4f3c8c52')

package() {
    cd "${srcdir}/Rhythmbox-Album-Shuffle-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/album-shuffle.svg -t "$pkgdir/usr/lib/rhythmbox/plugins/$_foldername"
}
