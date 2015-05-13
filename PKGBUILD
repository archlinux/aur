# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-daemon
pkgver=0.9.1
pkgrel=1
pkgdesc="News aggregator for Atom/RSS/RDF"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
optdepends=('canto-curses: Curses interface')
source=(https://github.com/themoken/canto-next/archive/v$pkgver.tar.gz)
md5sums=('1488b5ed9b5a685a25408cc6ce5cce40')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
