# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Lukas K. <lu at 0x83 dot eu>

_libname=webcolors
pkgname=python-$_libname
pkgver=1.7
pkgrel=1
pkgdesc=" Library for working with HTML/CSS color formats in Python"
arch=("any")
url="https://github.com/ubernostrum/webcolors"
license=('bsd')
depends=('python')
source=("https://pypi.python.org/packages/1c/11/d9fb5a7c872a941ad8b30a4be191253d5a9028834c4d69eab55bb6bc60be/$_libname-$pkgver.tar.gz#md5=4733fa1077f680bbdd918cdef1e32c11")
md5sums=("4733fa1077f680bbdd918cdef1e32c11")

package() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
