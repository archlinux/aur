pkgname=gestures
pkgver=0.2.2
pkgrel=2
pkgdesc="A minimal Gtk+ GUI app for libinput-gestures"
arch=('any')
url="https://gitlab.com/cunidev/gestures"
license=('GPL3')
depends=('python' 'libinput-gestures')
makedepends=('python-setuptools')
source=("https://gitlab.com/cunidev/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('d01a8dc98f69fab5267ed5e23947be2e362b2c98aaad2b722b451348215d9426')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

