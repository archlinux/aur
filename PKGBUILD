# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.3.7.5
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
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('06ab74bcaa6bef125201a9ff8d8c500ceffc860689f591415f52d8d28f21ddfd')

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
