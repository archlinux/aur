# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=python-pynetstring
_pkgbase=pynetstring
pkgver=0.5
pkgrel=1
pkgdesc="A module for encoding and decoding netstrings."
arch=('any')
url="https://github.com/rj79/pynetstring"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
sha256sums=('b1f33be38094336956765b2f2a70168ff51c6c497fd9ce6e3b1fd4504a52059e')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
