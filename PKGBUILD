# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-albumartist-filter
_foldername=albumartistfilter
pkgver=1.1.0
pkgrel=2
pkgdesc="Album Artist filtering plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-AlbumArtist-Filter"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a71eb7d7efa79664f346bb225ed9f4b7f7b18a331ddcc5c78021cd6bd95378df')

package() {
    cd "${srcdir}/Rhythmbox-AlbumArtist-Filter-${pkgver}"
    install -Dm644 ${_foldername}/${_foldername}.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/${_foldername}"
    install -Dm644 ${_foldername}/${_foldername}.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/${_foldername}"
}
