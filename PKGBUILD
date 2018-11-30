# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.9.1
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
install=urlscan.install
md5sums=('8fa1e5868d0ba6b4c518d9fbd95eaf08')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}
