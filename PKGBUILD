# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-music-metadata-filter
pkgver=2.0.1
pkgrel=1
pkgdesc="A module for cleaning up artist, album, and song names."
arch=("any")
url="https://github.com/djmattyg007/music-metadata-filter"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/m/music-metadata-filter/music-metadata-filter-${pkgver}.tar.gz")
sha256sums=("de1ce7e0196ee3a7e4509c8f6f004d2d9fb04c74a4901fd39f3cd27ece879145")

package() {
    cd "music-metadata-filter-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
