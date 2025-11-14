# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('aedd1d115e5c0ec99ec38a74942e46e0d4e3e71f3b09c2e8b8ba6b43fee21bfc')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
