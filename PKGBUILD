# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Scott Hansen (firecat53) firecat4153 at gmail

pkgname=urlscan
pkgver=0.8.6
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
url=https://github.com/firecat53/urlscan
arch=(any)
license=(GPL)
depends=(python python-urwid)
makedepends=(git python-setuptools)
source=("https://github.com/firecat53/urlscan/archive/$pkgver.tar.gz")
md5sums=('a216cbf4809ba2ead2b05db4235cba31')
install=urlscan.install

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return
    ./setup.py install --root="${pkgdir?}"
}

