# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="LianWall CLI - wallpaper playback, library and diagnostics client"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin>=6.0.0')
provides=("lianwall=$pkgver")
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('56f4aa4d6a516ff3f2063ea402c1cbcb7feaa11efa22ae17afa21fb0b3fea7f5')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}
