# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('4aec6d2647b07112987dfebe98c5e877d236f2347b22d23b4b7d6b294a1e435e')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
