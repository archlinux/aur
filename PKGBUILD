# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=espionage
pkgver=1.0
pkgrel=1
pkgdesc="PyEFL D-Bus inspector"
arch=('any')
url="https://phab.enlightenment.org/w/projects/espionage/"
license=('GPL3')
depends=('python-efl')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1afe5d0c2cc293613fb6091131795b1d43d34efbfb211760c88018c4c8791a89')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}"
}
