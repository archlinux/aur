# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=22.04.0
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('any')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module'
         'dbus-python' 'python-psutil' 'python-setproctitle' 'python-xlib')
makedepends=('python-setuptools' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('2ea250449ddab3e212c69d62fe336ff6fc098c8c4b530cbae06c50c912bb368e')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
