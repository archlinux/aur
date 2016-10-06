# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.8.3
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(git python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
md5sums=('b94925e969f0e8e3cba9d658562e138e')
install=urlscan.install

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}

