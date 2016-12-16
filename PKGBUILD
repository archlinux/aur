# Maintainer: M0Rf30

pkgname=python2-bleach
pkgver=1.5
pkgrel=2
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python2-html5lib-git')
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

md5sums=('c2b7c8c189ff86670a6e6edc3c86a63a')
