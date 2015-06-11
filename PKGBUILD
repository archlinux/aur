# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-angular-lrdragndrop"
pkgver=1.0.2.2
pkgrel=1
pkgdesc="XStatic-Angular-lrdragndrop"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-Angular-lrdragndrop"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-Angular-lrdragndrop/XStatic-Angular-lrdragndrop-${pkgver}.tar.gz")
md5sums=('afd682cab9f436cf22b025dfcabaa225')

package() {
  pip2 install --root ${pkgdir} XStatic-Angular-lrdragndrop-${pkgver}.tar.gz
}
