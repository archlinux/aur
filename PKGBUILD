# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=22.04.1
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('any')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module'
         'dbus-python' 'python-psutil' 'python-setproctitle' 'python-xlib')
makedepends=('python-setuptools' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('3acd6c6c071920d201ff08564d35e9e1ca0c4d5e1c565465ccb9b077e2cd3dba')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
