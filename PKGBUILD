# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-wifi
pkgver=v1.0.5
pkgrel=2
epoch=
pkgdesc="kaf wifi传书软件,支持kindle"
arch=('x86_64')
url="https://github.com/ystyle/kaf-wifi"
license=('MulanPSL')
source=("https://github.com/ystyle/kaf-wifi/releases/download/$pkgver/kaf-wifi_${pkgver}_linux_amd64.zip")
md5sums=('8bac52849c063a055d8dfb7f586b210d')

package() {
    install -Dm755 kaf-wifi "$pkgdir/usr/bin/kaf-wifi"
}
