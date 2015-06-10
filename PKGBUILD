# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-ansicolors
_pkgname=ansicolors
pkgver=1.0.2
pkgrel=1
pkgdesc="ANSI colors for Python"
arch=('any')
url="https://github.com/verigak/colors/"
license=('ISC')
depends=('python2')
makedepends=("python2-distribute")
source=("http://pypi.python.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("d3a19fcd75c89772360e0d2b693fc50f")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
