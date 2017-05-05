# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.4.9
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-yaml' 'python-evdev')
makedepends=('python-setuptools')
optdepends=(
  'python-pyinotify: Enhanced Steam integration.'
  )
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('635e1b34084d9b2419575fd25097e36689e0f59c50bff89a4a3494e644fa4be9')

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
