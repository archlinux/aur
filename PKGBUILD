# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: fsckd <fsckdaemon@gmail.com>
# Contributor: Kniyl <mathias.ettinger@gmail.com>
# Contributor: numeral <numerical@gmail.com>

pkgname=python-bleach
pkgver=1.4.3
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python-html5lib')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/e0/e0/8c5cc2822d2035d64cf7b4278077a7ec1e0afde7e9051128f722ec8cd97a/bleach-${pkgver}.tar.gz")
sha256sums=('1293061adb5a9eebb7b260516e691785ac08cc1646c8976aeda7db9dbb1c6f4b')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
