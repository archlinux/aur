# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-daemon
pkgver=0.9.5
pkgrel=6
pkgdesc="News aggregator for Atom/RSS/RDF"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
optdepends=('python-requests: Needed by inoreader plugin')
provides=('canto-next-git=0.9.5')
source=(https://github.com/themoken/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('128a5e59400bbf6f472c0109e66c6250')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
