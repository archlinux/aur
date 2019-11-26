# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=python-pynetstring
_pkgbase=pynetstring
pkgver=0.2
pkgrel=1
pkgdesc="A module for encoding and decoding netstrings."
arch=('any')
url="https://github.com/rj79/pynetstring"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
sha256sums=('6ba299b7e6775904c38c726d27f1f29713c5b462b8500a726b4c92bdb121e2b4')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
