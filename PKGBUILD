# Maintainer: Pei Ding <oaklight at gmx dot com>
pkgname=niri-notify-focus
pkgver=0.2.2
pkgrel=1
pkgdesc="Focus source window on notification click for the niri Wayland compositor"
arch=('any')
url="https://github.com/Oaklight/niri-notify-focus"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject')
optdepends=('niri: required Wayland compositor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('61cacbcea78d55d75f4f50d41576a000dd822af4bfb81f0c04e297ddb247c5ff')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
