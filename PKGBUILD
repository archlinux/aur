# Maintainer: Pei Ding <oaklight at gmx dot com>
pkgname=niri-notify-focus
pkgver=0.2.1
pkgrel=1
pkgdesc="Focus source window on notification click for the niri Wayland compositor"
arch=('any')
url="https://github.com/Oaklight/niri-notify-focus"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject')
optdepends=('niri: required Wayland compositor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e1f62489d4fdf8ec9b0eb8e6f33c7fdbaf306630d9a85b90cc51efed58731a74')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
