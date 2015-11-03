# Maintainer: Victor Häggqvist <aur a snilius d com>
pkgname=python-misaka-v1
_pkgname=misaka
pkgver=1.0.2
pkgrel=2
pkgdesc="The Python binding for Sundown, a markdown parsing library."
arch=('i686' 'x86_64')
url="http://misaka.61924.nl/"
license=('MIT')
depends=('python')
options=(!emptydirs)
conflicts=('python-misaka')
source=("https://pypi.python.org/packages/source/m/misaka/misaka-${pkgver}.tar.gz")
sha256sums=('6197e4886ff0c2718df1b472e40b5fea45f447a7a5b0192a48123ee868973517')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
