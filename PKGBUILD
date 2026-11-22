# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=6.0.1
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
sha256sums=('2c38745162f81714574ee335e49884d26c7da4687f1434b075be491e2b6c8542')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}
