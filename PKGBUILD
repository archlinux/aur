# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-rickshaw"
pkgver=1.5.0.0
pkgrel=1
pkgdesc="XStatic-Rickshaw"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Rickshaw"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Rickshaw/XStatic-Rickshaw-${pkgver}.tar.gz")
md5sums=('789fffdced10e93e10f75ce1ade6fc6c')

package() {
  pip2 install --root ${pkgdir} XStatic-Rickshaw-${pkgver}.tar.gz
}
