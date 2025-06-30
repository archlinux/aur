# Maintainer: Artur Roszczyk <artur.roszczyk@gmail.com>
pkgname=waystt-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Speech-to-text tool for Wayland (binary)"
arch=('x86_64')
url="https://github.com/sevos/waystt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'openssl' 'pipewire')
provides=('waystt')
conflicts=('waystt')
source=("waystt-linux-x86_64::https://github.com/sevos/waystt/releases/download/v${pkgver}/waystt-linux-x86_64")
sha256sums=('b3da484426cd6fe5f5912db44dd2e75de2ca2931bfde4deaa4e8a0dfb84f9522')

package() {
    install -Dm755 "$srcdir/waystt-linux-x86_64" "$pkgdir/usr/bin/waystt"
}