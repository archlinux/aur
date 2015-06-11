# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jquery.quicksearch"
pkgver=2.0.3.1
pkgrel=1
pkgdesc="XStatic-JQuery.quicksearch"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-JQuery.quicksearch"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-JQuery.quicksearch/XStatic-JQuery.quicksearch-${pkgver}.tar.gz")
md5sums=('0dc4bd1882cf35dc7b19a236ba09b89d')

package() {
  pip2 install --root ${pkgdir} XStatic-JQuery.quicksearch-${pkgver}.tar.gz
}
