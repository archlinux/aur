# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=python-ly
pkgver=0.9.2
pkgrel=1
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/wbsoft/python-ly"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/wbsoft/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('71f996a12b306a816b40bc2d40098cf5b9a1443ef379d8c2e01560c4c1c52b5c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
