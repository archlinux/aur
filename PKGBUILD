# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=pyglossary
pkgver=3.0.4
pkgrel=1
pkgdesc="A tool for converting dictionary files aka glossaries with various formats for different dictionary applications"
arch=(any)
url="https://github.com/ilius/pyglossary"
license=('GPL3')
depends=('python')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/ilius/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('be0c88987ca4791a858271a7c9acdbd6a680e4fdc61ddc6ad2d06b090a1bdc6e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
