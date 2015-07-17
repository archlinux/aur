# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-daemon
pkgver=0.9.2
pkgrel=1
pkgdesc="News aggregator for Atom/RSS/RDF"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
optdepends=('canto-curses: Curses interface')
source=(https://github.com/themoken/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('93b493471cdc90cf01f58ef859dd2da7')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
