# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: PeterCP <petercp@vivaldi.net>
# Contributor: IKRadulov <ikradulov@vivaldi.net> 

pkgname=mate-hud
pkgver=19.10.1
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD"
arch=('x86_64' 'i686')
url="https://github.com/ubuntu-mate/mate-hud"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module'
         'python-dbus' 'python-psutil' 'python-setproctitle' 'python-xlib')
makedepends=('python-setuptools' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu-mate/mate-hud/archive/${pkgver}.tar.gz")
sha256sums=('1f3395f7355b0649b0db443489f2e19502f20d81a99d0f88c5e1cffbfe3a9e66')

package() {
    cd "${pkgname}-${pkgver}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
