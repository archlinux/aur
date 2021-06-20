# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-wifi
pkgver=v1.0.4
pkgrel=1
epoch=
pkgdesc="kaf wifi传书软件,支持kindle"
arch=('x86_64')
url="https://github.com/ystyle/kaf-wifi"
license=('MulanPSL')
source=("https://github.com/ystyle/kaf-wifi/releases/download/$pkgver/kaf-wifi-linux.zip")
md5sums=('28d7a457e0bcca48ce17e8d116145468')

package() {
    install -Dm755 kaf-wifi-linux "$pkgdir/usr/bin/kaf-wifi"
}
