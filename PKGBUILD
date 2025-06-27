# Maintainer: Artur Roszczyk <artur.roszczyk@gmail.com>
pkgname=waystt-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Speech-to-text tool for Wayland (binary)"
arch=('x86_64')
url="https://github.com/sevos/waystt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'openssl' 'pipewire')
provides=('waystt')
conflicts=('waystt')
source=("waystt-linux-x86_64::https://github.com/sevos/waystt/releases/download/v${pkgver}/waystt-linux-x86_64")
sha256sums=('0ededf4f153c04f2a8eba26a5994cd0c4d33da041a3d902ee9210c16db9e8d7f')

package() {
    install -Dm755 "$srcdir/waystt-linux-x86_64" "$pkgdir/usr/bin/waystt"
}