# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-openid')
pkgver=3.0.9
pkgrel=1
pkgdesc="Python3 port of the python-openid library"
arch=(any)
url="https://github.com/necaris/python3-openid"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
depends=('python-defusedxml')
source=("https://github.com/necaris/python3-openid/archive/v${pkgver}.tar.gz")
sha256sums=('0e043d1f9402b5e00531813f7f4f0ac822c969fb21b13d6690a57ee6bd6f801a')

build() {
  cd "$srcdir/python3-openid-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python3-openid-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
