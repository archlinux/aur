# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-albumartist-filter
pkgver=1.0.0
pkgrel=1
pkgdesc="Continuous album shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-AlbumArtist-Filter"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b837bff078ec3c2423b21592cb4aa23ad235c5ec4706170268a5ce4361a418e')

package() {
    cd "${srcdir}/Rhythmbox-AlbumArtist-Filter-${pkgver}"
    install -Dm644 albumartistfilter/albumartistfilter.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/albumartistfilter"
    install -Dm644 albumartistfilter/albumartistfilter.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/albumartistfilter"
}
