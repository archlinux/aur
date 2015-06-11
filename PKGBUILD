# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jquery-ui"
pkgver=1.11.0.1
pkgrel=1
pkgdesc="XStatic-jquery-ui"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-jquery-ui"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-jquery-ui/XStatic-jquery-ui-${pkgver}.tar.gz")
md5sums=('03d8ea7a0dab29d548e7bc195703b04f')

package() {
  pip2 install --root ${pkgdir} XStatic-jquery-ui-${pkgver}.tar.gz
}
