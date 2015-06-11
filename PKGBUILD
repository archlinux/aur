# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-angular"
pkgver=1.3.7.0
pkgrel=1
pkgdesc="XStatic-Angular"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Angular"
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Angular/XStatic-Angular-${pkgver}.tar.gz")
md5sums=('fa26884ab0b2acfa09e372aedd7e7b04')

package() {
  pip2 install --root ${pkgdir} XStatic-Angular-${pkgver}.tar.gz
}
