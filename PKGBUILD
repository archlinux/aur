# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=python-pynetstring
_pkgbase=pynetstring
pkgver=0.1.dev2
pkgrel=1
pkgdesc="A module for encoding and decoding netstrings."
arch=('any')
url="https://github.com/rj79/pynetstring"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
sha256sums=('5572388dd28aae310ec1a4bac92d9097f26e4cd3962438daa9850106bb9ac970')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
