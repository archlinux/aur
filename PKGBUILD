# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: fsckd <fsckdaemon@gmail.com>
# Contributor: Kniyl <mathias.ettinger@gmail.com>
# Contributor: numeral <numerical@gmail.com>

pkgname=python-bleach
pkgver=1.4.2
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python-html5lib')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")
sha256sums=('56018a17d1488eb1a1e18e7cdddcaea24d3c7b3704172e356f6916c577f4fd9e')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
