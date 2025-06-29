# Maintainer: Artur Roszczyk <artur.roszczyk@gmail.com>
pkgname=waystt-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Speech-to-text tool for Wayland (binary)"
arch=('x86_64')
url="https://github.com/sevos/waystt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'openssl' 'pipewire')
provides=('waystt')
conflicts=('waystt')
source=("waystt-linux-x86_64::https://github.com/sevos/waystt/releases/download/v${pkgver}/waystt-linux-x86_64")
sha256sums=('95e0ccebb27e80b16f66e965a611dcf84b07e407247657c79d15ab66d894d8fb')

package() {
    install -Dm755 "$srcdir/waystt-linux-x86_64" "$pkgdir/usr/bin/waystt"
}