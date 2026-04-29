# Maintainer: Pei Ding <oaklight at gmx dot com>
pkgname=niri-notify-focus
pkgver=0.1.0
pkgrel=1
pkgdesc="Focus source window on notification click for the niri Wayland compositor"
arch=('any')
url="https://github.com/Oaklight/niri-notify-focus"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject')
optdepends=('niri: required Wayland compositor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a6b3f3dd1b153bba5ff0a7ad73f7d43dabde8cde58611bcb4dfe7a9cb9701f43')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
