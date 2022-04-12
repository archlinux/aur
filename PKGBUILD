# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=22.04.4
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('any')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module'
         'dbus-python' 'python-psutil' 'python-setproctitle' 'python-xlib')
makedepends=('python-setuptools' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('4948df8f8e0cd057104667da7ce9d310efa0e065fdbb90b55e55c75da99af335')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
