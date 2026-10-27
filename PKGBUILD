# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-album-shuffle
_foldername=albumshuffle
pkgver=1.2.0
pkgrel=2
pkgdesc="Continuous album shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Album-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19a01d5795af275e270f8a17e78592bd4649cbd0e6328912610cf9df62e73ab1')

package() {
    cd "${srcdir}/Rhythmbox-Album-Shuffle-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/album-shuffle.svg -t "$pkgdir/usr/lib/rhythmbox/plugins/$_foldername"
}
