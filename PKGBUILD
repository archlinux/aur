# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-magic-search"
pkgver=0.2.0.1
pkgrel=1
pkgdesc="XStatic-Magic-Search"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Magic-Search"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Magic-Search/XStatic-Magic-Search-${pkgver}.tar.gz")
md5sums=('e4ce9925f88f1a901a19563f63b66f95')

package() {
  pip2 install --root ${pkgdir} XStatic-Magic-Search-${pkgver}.tar.gz
}
