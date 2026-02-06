# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=5.1.1
pkgrel=1
pkgdesc="LianWall CLI - wallpaper engine based on swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin')
provides=('lianwall')
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('0a3b7ffaa3f38557bddd03a4814b2f86ab8b17425078c4bd139de60d66ba0322')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}

