# Maintainer: Dmitriy Morozov <archlinux@foxcub.org>
pkgname=python2-fastcluster
_pkgname=fastcluster
pkgver=1.1.13
pkgrel=1
pkgdesc="Fast hierarchical clustering routines for Python"
url="http://danifold.net/fastcluster.html"
arch=('i686' 'x86_64')
license="GPL" 
depends=('python2' 'python2-numpy')
source=("https://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('ca2a5f5e8ab81628c72ed2cc0e1e21c6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}
