# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jquery"
pkgver=1.10.2.1
pkgrel=1
pkgdesc="XStatic-jQuery"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-jQuery"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-jQuery/XStatic-jQuery-${pkgver}.tar.gz")
md5sums=('7a29efeab6961ef00ea2272c923f4503')

package() {
  pip2 install --root ${pkgdir} XStatic-jQuery-${pkgver}.tar.gz
}
