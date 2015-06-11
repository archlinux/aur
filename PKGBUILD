# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-d3"
pkgver=3.1.6.2
pkgrel=1
pkgdesc="XStatic-D3"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-D3"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-D3/XStatic-D3-${pkgver}.tar.gz")
md5sums=('835164e50cfbeb781a42e4d16f75a50c')

package() {
  pip2 install --root ${pkgdir} XStatic-D3-${pkgver}.tar.gz
}
