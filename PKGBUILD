# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python2-pefile
_pyname=pefile
pkgname=('python2-pefile')
makedepends=('python2')
_pkgverorig=1.2.10-123
pkgver=1.2.10.123
pkgrel=1
pkgdesc="A multi-platform Python module to parse and work with PE files"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
source=("https://github.com/erocarrera/$_pyname/archive/$_pyname-$_pkgverorig.tar.gz")
sha512sums=('344ad94b62d7192bea17e853a1657b3782749da325f4721872e52f95827047064b51444fe24060b3fe11559c068b82c59dc2627795e7912d58513e774290e71c')

package() {
  cd "$srcdir/$_pyname-$_pyname-$_pkgverorig"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
