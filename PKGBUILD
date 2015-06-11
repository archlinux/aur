# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-qunit"
pkgver=1.14.0.2
pkgrel=1
pkgdesc="XStatic-QUnit"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-QUnit"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-QUnit/XStatic-QUnit-${pkgver}.tar.gz")
md5sums=('21d48252d3301bd7ae530bfeffa3d108')

package() {
  pip2 install --root ${pkgdir} XStatic-QUnit-${pkgver}.tar.gz
}
