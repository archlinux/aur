# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-bootstrap-scss"
pkgver=3.2.0.0
pkgrel=1
pkgdesc="XStatic-Bootstrap-SCSS"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Bootstrap-SCSS"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Bootstrap-SCSS/XStatic-Bootstrap-SCSS-${pkgver}.tar.gz")
md5sums=('903d7de8aef6bee93d976b42d35edf7b')

package() {
  pip2 install --root ${pkgdir} XStatic-Bootstrap-SCSS-${pkgver}.tar.gz
}
