# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.8.8
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
md5sums=('95692de49398bc8eb6dec2464073dbae')
install=urlscan.install

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}
