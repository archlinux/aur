# Maintainer: Visa Jokelainen <visaj at iki dot fi>
_pkgname=py-ubjson
pkgname=python2-ubjson
pkgver=0.9.0
pkgrel=1
pkgdesc="Universal Binary JSON encoder/decoder"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/py-ubjson/"
license=('Apache')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/d4/40/a80006884ec03a54a5c6c53ae76df9978536862f0683b6e6280e3808d289/$_pkgname-${pkgver}.tar.gz")
md5sums=(c78bbe899eeba9604302ad746094e8d1)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
