# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=22.04.2
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('any')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module'
         'dbus-python' 'python-psutil' 'python-setproctitle' 'python-xlib')
makedepends=('python-setuptools' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('1908b241fc5d9a54ee4654a4c5e100b9e4235ca7bd18f0cebec33ab179e78cab')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
