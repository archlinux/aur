# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.4.0
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-xdg' 'python-yaml'
         'xdg-user-dirs')
makedepends=('python-setuptools')
optdepends=(
  'python-evdev: Detecting connected joypads.'
  'python-pyinotify: Enhanced Steam integration.'
  )
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('942768ef335665d902edd1c7c570f40f0d13f45e782c81cfd9af28381d300bcd')

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
