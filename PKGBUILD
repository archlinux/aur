# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=5.1.6
pkgrel=1
pkgdesc="LianWall CLI - wallpaper engine based on swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin')
provides=('lianwall')
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('4156a578814870ee58d9437f2eba5f8731e2c77d5b249eefb080997a2476776b')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}

