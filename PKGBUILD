# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=5.5.2
pkgrel=1
pkgdesc="LianWall CLI - wallpaper engine based on awww/swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin')
provides=('lianwall')
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('dd4793bafabd5e59728c1cfe14e039b0099fe9b80b140ba2525cf8fe7ce3e3c8')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}

