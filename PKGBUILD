# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-tifffile
pkgver=2018.11.6
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://files.pythonhosted.org/packages/f4/bf/4ab68d44761f3e1812e78603a9309195cf588edc1f9e675a8b49c0293925/tifffile-2018.11.6.tar.gz)
sha256sums=('66a2fa7223cfe96a9aafa88177a711964878c9a062876c52fcb044d63a4608a3')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
