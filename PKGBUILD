# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.3.7.3
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python2-dbus' 'python2-gobject' 'python2-xdg' 'python2-yaml'
         'xdg-user-dirs')
makedepends=('python2-setuptools')
install='lutris.install'
source=("https://lutris.net/releases/lutris_${pkgver}.tar.gz")
sha256sums=('a07dc2e7d27bf5d593032c5eafd671b1e458b104abc4078c6d193d28ef297fc6')

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
