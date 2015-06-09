# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
_pkgname=python-feedparser
pkgname=python-feedparser-doc
pkgver=5.1.3
pkgrel=2
pkgdesc="Parse RSS and Atom feeds in Python. Documentation."
arch=('any')
url="http://code.google.com/p/feedparser/"
license=('custom')
changelog=ChangeLog
makedepends=('python-sphinx')
source=("http://feedparser.googlecode.com/files/feedparser-${pkgver}.tar.bz2")
sha1sums=('dfe654e4babd258b1402b89e889d78330206d78c')

package() {
    sphinx-build -b html feedparser-$pkgver/docs/ $pkgdir/usr/share/doc/$_pkgname
    install -m 644 -D feedparser-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

