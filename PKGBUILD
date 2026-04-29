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
sha256sums=('c65b960e72d9593a2bac502c7ee89169f8c624c7d2a208fed356d8e8b4a336b8')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
