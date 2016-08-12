# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.3.8
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python2-dbus' 'python2-gobject' 'python2-xdg' 'python2-yaml'
         'xdg-user-dirs')
makedepends=('python2-setuptools')
optdepends=(
  'python2-evdev: Detecting connected joypads.'
  'python2-pyinotify: Enhanced Steam integration.'
  )
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('404b8379dbf9dcab6e25bca781b8afe0b3f9cd9b27ff58cba8b8c98f54fb74f4')

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
