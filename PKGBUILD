# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.4.14
pkgrel=2
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-yaml' 'python-evdev'
         'lib32-sqlite')
optdepends=(
    'wine: recommended to avoid dependency issues'
    'wine-staging: recommended to avoid dependency issues (Staging patches)'
    'wine-gaming-nine: recommended to avoid dependency issues (Gallium9 patches)'
)
makedepends=('python-setuptools')
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('379df37d2cca46e7678c4a3f26b5033007bc5be10f861e684cd04f45175d8039')

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
