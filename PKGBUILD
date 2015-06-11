# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jsencrypt"
pkgver=2.0.0.2
pkgrel=1
pkgdesc="XStatic-JSEncrypt"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-JSEncrypt"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-JSEncrypt/XStatic-JSEncrypt-${pkgver}.tar.gz")
md5sums=('a2a24f2990500d6709643c3413dd93f8')

package() {
  pip2 install --root ${pkgdir} XStatic-JSEncrypt-${pkgver}.tar.gz
}
