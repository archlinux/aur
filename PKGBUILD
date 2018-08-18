# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.9.0
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
md5sums=('80faab8b14e548ab336d9bcaeeb9cd52')
install=urlscan.install

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}
