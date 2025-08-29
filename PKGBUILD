# Maintainer: Artur Roszczyk <artur.roszczyk@gmail.com>
pkgname=waystt-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Speech-to-text tool for Wayland (binary)"
arch=('x86_64')
url="https://github.com/sevos/waystt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'openssl' 'pipewire')
provides=('waystt')
conflicts=('waystt')
source=("waystt-linux-x86_64::https://github.com/sevos/waystt/releases/download/v${pkgver}/waystt-linux-x86_64")
sha256sums=('dec6d3af937460dba366a134f24f998b55ed0693d72ba94c43adaa242dd9016b')

package() {
    install -Dm755 "$srcdir/waystt-linux-x86_64" "$pkgdir/usr/bin/waystt"
}