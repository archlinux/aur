# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=6.0.0
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
sha256sums=('5f28b89cec8ceffb11e10c2143edfbaaf4e0b392bdb30fe9ca48bed52d29ab02')

package() {
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwall"
}
