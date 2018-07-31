# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.4.18.1
pkgrel=2
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-yaml' 'python-evdev'
         'lib32-sqlite' 'cabextract')
optdepends=(
    'wine: recommended to avoid dependency issues'
    'wine-staging: recommended to avoid dependency issues (Staging patches)'
    'wine-gaming-nine: recommended to avoid dependency issues (Gallium9 patches)'
)
makedepends=('python-setuptools')
source=("https://lutris.net/releases/lutris_${pkgver}.tar.xz")
sha256sums=('0c7f4979890f11378813acbd975b0a69905cb777ef87eccf5d179d6911ff4385')

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
