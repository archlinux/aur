# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="LianWall CLI - wallpaper engine based on awww/swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin')
provides=('lianwall')
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('184a63ffa96a63667cb4039ae6cd02faf52754659a66f4e15fde3f5f39079a89')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}

