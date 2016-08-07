# Maintainer: M0Rf30

pkgname=python2-bleach
pkgver=1.4.3
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python2-html5lib')
makedepends=('python2-setuptools')
source=("https://github.com/mozilla/bleach/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('fbb724f677f272ecf26fba4e8b3ce968')
