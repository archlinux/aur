# Maintainer: PeterCP <petercp@vivaldi.net>
# Maintainer: IKRadulov <ikradulov@vivaldi.net> 
# Contributors:

pkgname=mate-hud
pkgver=18.04.7
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('x86_64' 'i686')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'gobject-introspection' 'mate-desktop' 'appmenu-gtk-module-git'
         'python' 'python-dbus' 'python-psutil' 'python-setproctitle'
         'python-xlib')
optdepends=('appmenu-qt')
makedepends=('python-setuptools')
source=('https://github.com/ubuntu-mate/mate-hud/archive/18.04.7.tar.gz')
sha256sums=('9c73b279033b43c03b3695ae617109fefe3fc8d8547f74a6da10df09b08f09c6')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
