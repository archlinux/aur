# Maintainer: Artur Roszczyk <artur.roszczyk@gmail.com>
pkgname=waystt-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Speech-to-text tool for Wayland (binary)"
arch=('x86_64')
url="https://github.com/sevos/waystt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'openssl' 'pipewire' 'ydotool' 'wtype')
provides=('waystt')
conflicts=('waystt')
source=("waystt-linux-x86_64::https://github.com/sevos/waystt/releases/download/v${pkgver}/waystt-linux-x86_64")
sha256sums=('949f15064c952e8f0327cc9c6c83e20be7c656aac2ed9969638fe251fa312033')

package() {
    install -Dm755 "$srcdir/waystt-linux-x86_64" "$pkgdir/usr/bin/waystt"
}