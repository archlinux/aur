# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=5.5.3
pkgrel=1
pkgdesc="LianWall CLI - wallpaper engine based on awww/swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('lianwalld-bin')
provides=('lianwall')
conflicts=('lianwall')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwall_${pkgver}_linux_x86_64")
sha256sums=('3e569d0a8c2b1c8098eaf1afa5d240bd232555a75cf10d7a0410084ccc538ad9')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}

