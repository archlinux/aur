# Maintainer: Mike Cooper <mythmon@elem.us>
pkgname=field
pkgver=0.2.0
pkgrel=1
pkgdesc="Extact fields from a file or stdin"
arch=('any')
url="https://pypi.python.org/pypi/field/0.2.0"
license=('GPL3')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('64eb76b875a128041eb31b625b435616')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
