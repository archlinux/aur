# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-term.js"
pkgver=0.0.4.2
pkgrel=1
pkgdesc="XStatic-term.js"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-term.js"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-term.js/XStatic-term.js-${pkgver}.tar.gz")
md5sums=('2224354fa1d98599d9383df5b2e749b7')

package() {
  pip2 install --root ${pkgdir} XStatic-term.js-${pkgver}.tar.gz
}
