# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>

pkgname=python2-parsley
_pkgname=Parsley
pkgver=1.3
pkgrel=1
pkgdesc="A parser generator library based on OMeta, and other useful parsing tools."
arch=('any')
url="https://github.com/pyga/parsley"
license=('MIT')
depends=('python2')
conflicts=('python2-parsley-git')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
sha512sums=('b87ebc44796e8511ad113f06d7bd4ebfec0161cfc8cd4d1db214da821ff61884328931ab39fdf34d33df5c9e803a1c3f5ac31e7ede176262f54b8b0a9cf3818b')
