# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
_pkgname=python-feedparser
pkgname=python-feedparser-doc
pkgver=5.2.1
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in Python. Documentation."
arch=('any')
url="https://github.com/kurtmckee/feedparser"
license=('custom')
makedepends=('python-sphinx')
source=("https://github.com/kurtmckee/feedparser/archive/${pkgver}.tar.gz")
sha1sums=('13c9a17f821e46ba9a34d8777e0ae47a6eb86de4')

package() {
    sphinx-build -b html feedparser-$pkgver/docs/ $pkgdir/usr/share/doc/$_pkgname
    install -m 644 -D feedparser-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

