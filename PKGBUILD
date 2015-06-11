# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-smart-table"
pkgver=1.4.5.3
pkgrel=1
pkgdesc="XStatic-smart-table"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-smart-table"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-smart-table/XStatic-smart-table-${pkgver}.tar.gz")
md5sums=('fb32bcbfb7ff05cd17ba65aae10946f9')

package() {
  pip2 install --root ${pkgdir} XStatic-smart-table-${pkgver}.tar.gz
}
