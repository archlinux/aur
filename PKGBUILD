# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-txsocksx
_pkgname=txsocksx
pkgver=1.15.0.2
pkgrel=1
pkgdesc="SOCKS{4,4a,5} endpoints for twisted"
arch=('any')
url="https://github.com/habnabit/txsocksx"
license=('MIT')
depends=('python2' 'python2-twisted' 'python2-pyopenssl' 'python2-parsley')
conflicts=('python2-txsocksx-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
sha512sums=('a9a214248aa299b3f2def0e15c3a9c2f78286bc245421844f17d1535b5bb62b7a0a6ee8f1e72963556f8658c8eb914ce4e2e2e0c135abdea3e5a8a1d2165f988')
