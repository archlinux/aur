# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=22.10.3
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('any')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('appmenu-gtk-module' 'dbus-python' 'hicolor-icon-theme' 'mate-desktop'
         'python-gobject' 'python-psutil' 'python-pyinotify' 'python-setproctitle'
         'python-xlib' 'rofi')
makedepends=('python-setuptools' 'python-distutils-extra')
optdepends=('DBUS-PLOTINUS: plotinus backend')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('763bf4251ba5efbfa2350267f9819888b675798e6fb15206d8a745cd8c3d1e6b')

package() {
  cd "${pkgname}-${pkgver}"
  ./setup.py install --root="${pkgdir}" --optimize=1
}
