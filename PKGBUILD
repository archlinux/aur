# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-hogan"
pkgver=2.0.0.2
pkgrel=1
pkgdesc="XStatic-Hogan"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Hogan"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Hogan/XStatic-Hogan-${pkgver}.tar.gz")
md5sums=('1c1de09c4813e8568aab98fa5270d6a0')

package() {
  pip2 install --root ${pkgdir} XStatic-Hogan-${pkgver}.tar.gz
}
