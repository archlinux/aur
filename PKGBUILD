# Maintainer: Pei Ding <oaklight at gmx dot com>
pkgname=niri-notify-focus
pkgver=0.2.0
pkgrel=1
pkgdesc="Focus source window on notification click for the niri Wayland compositor"
arch=('any')
url="https://github.com/Oaklight/niri-notify-focus"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject')
optdepends=('niri: required Wayland compositor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('48c214d5ac5a52ee5badcab85b45dc9c93b615749bc12b0e68184d5bfbbb34da')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
