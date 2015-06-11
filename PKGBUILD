# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jquery-migrate"
pkgver=1.2.1.1
pkgrel=1
pkgdesc="XStatic-jQuery-Migrate"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-jQuery-Migrate"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-JQuery-Migrate/XStatic-JQuery-Migrate-${pkgver}.tar.gz")
md5sums=('2dd39f9d6351aeaf129b33d4134ac6a7')

package() {
  pip2 install --root ${pkgdir} XStatic-JQuery-Migrate-${pkgver}.tar.gz
}
