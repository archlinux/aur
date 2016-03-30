# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-openid')
pkgver=3.0.10
pkgrel=1
pkgdesc="Python3 port of the python-openid library"
arch=(any)
url="https://github.com/necaris/python3-openid"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
depends=('python-defusedxml')
source=("https://github.com/necaris/python3-openid/archive/v${pkgver}.tar.gz")
sha256sums=('e2c5b980440330dc76af3ff49a5608f034c2f123a75c8d33687e96a0007525ff')

build() {
  cd "$srcdir/python3-openid-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python3-openid-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
