# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jasmine"
pkgver=2.1.2.0
pkgrel=1
pkgdesc="XStatic-Jasmine"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Jasmine"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Jasmine/XStatic-Jasmine-${pkgver}.tar.gz")
md5sums=('63fdb4a8668eb70ceef1a311e8b02dcb')

package() {
  pip2 install --root ${pkgdir} XStatic-Jasmine-${pkgver}.tar.gz
}
