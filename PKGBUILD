# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-cli
pkgver=v1.0.3
pkgrel=1
epoch=
pkgdesc="kaf wifi传书软件,支持kindle"
arch=('x86_64')
url="https://github.com/ystyle/kaf-wifi"
license=('MulanPSL')
source=("https://github.com/ystyle/kaf-wifi/releases/download/$pkgver/kaf-wifi-linux.zip")
md5sums=('c1ed98fa499f216fd9c261fcf2dd6ed0')

package() {
    install -Dm755 kaf-wifi-linux "$pkgdir/usr/bin/kaf-wifi"
}
