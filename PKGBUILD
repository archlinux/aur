# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-font-awesome"
pkgver=4.3.0.0
pkgrel=1
pkgdesc="XStatic-Font-Awesome"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Font-Awesome"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Font-Awesome/XStatic-Font-Awesome-${pkgver}.tar.gz")
md5sums=('56e637fe7b3dcdd2ebd683996ad60759')

package() {
  pip2 install --root ${pkgdir} XStatic-Font-Awesome-${pkgver}.tar.gz
}
