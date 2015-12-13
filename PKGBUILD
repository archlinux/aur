# Maintainer: José Luis Lafuente <jl@lafuente.me>

pkgname='python2-pywatchman'
pkgver=1.3.0
pkgrel=0
pkgdesc="Watchman client for python"
url="https://facebook.github.io/watchman/"
license=('Apache')
arch=('x86_64' 'i686')
depends=('python2' 'watchman')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pywatchman/pywatchman-$pkgver.tar.gz")

package() {
  cd "$srcdir/pywatchman-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha256sums=('c3d5be183b5b04f6ad575fc71b06dd196185dea1558d9f4d0598ba9beaab8245')

# vim:set ts=2 sw=2 et:
