# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-bootstrap-datepicker"
pkgver=1.3.1.0
pkgrel=1
pkgdesc="XStatic-Bootstrap-Datepicker"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Bootstrap-Datepicker/XStatic-Bootstrap-Datepicker-${pkgver}.tar.gz")
md5sums=('c2f5c58a7b41162923eca5a36b29b8b2')

package() {
  pip2 install --root ${pkgdir} XStatic-Bootstrap-Datepicker-${pkgver}.tar.gz
}
