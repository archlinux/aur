# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-clize
pkgver=3.0
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python2' 'python2-sigtools')
source=(http://pypi.python.org/packages/source/c/clize/clize-${pkgver}.tar.gz)
sha256sums=('158e3251106fa9c2dfe414a3fea0c07eecb15b5be6ddf68a7cf73402081c79f6')

package() {
  cd "$srcdir/clize-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
