# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.8.9
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
md5sums=('1a473ca7edd18f7589d89bd757f8230c')
install=urlscan.install

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}
