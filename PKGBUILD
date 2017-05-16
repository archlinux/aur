# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.4.10
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
sha256sums=('6ad3e5d08a7ce1644b3cf0bd50d928b14b6a30d82eec6a5b899c2d8a55d747c6')

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
