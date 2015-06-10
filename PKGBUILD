# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-parsley
_pkgname=Parsley
pkgver=1.2
pkgrel=2
pkgdesc="A parser generator library based on OMeta, and other useful parsing tools."
arch=('any')
url="https://github.com/python-parsley/parsley"
license=('MIT')
depends=('python2')
conflicts=('python2-parsley-git')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir -O1
}

# vim:set ts=2 sw=2 et:

md5sums=('9905aa78f3256604f56e7bdd6aaf6123')
