# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-spin"
pkgver=1.2.5.2
pkgrel=1
pkgdesc="XStatic-Spin"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Spin"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Spin/XStatic-Spin-${pkgver}.tar.gz")
md5sums=('df83f80fd0b11545b64497112996e49e')

package() {
  pip2 install --root ${pkgdir} XStatic-Spin-${pkgver}.tar.gz
}
