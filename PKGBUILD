# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-hoep
pkgver=1.0.2
pkgrel=1
pkgdesc="A Python binding for the Hoedown Markdown library."
arch=('i686' 'x86_64')
url="https://github.com/Anomareh/Hoep"
license=('BSD')
depends=('python2>=2.7')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/hoep/hoep-${pkgver}.tar.gz")
sha256sums=('712d6f890138e4f785bcfa8147f7e8eac802ae5543f533edbd810c5beabf7c7a')

package() {
  cd "$srcdir/hoep-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
