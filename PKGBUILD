# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=go-do
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple terminal to do program."
arch=('x86_64')
url="https://github.com/FryDay/go-do"
source=("https://github.com/FryDay/go-do/releases/download/v$pkgver/$pkgname-linux.tar.gz")
sha256sums=('37ab1f0f87d71566729fce7243fde2d1a5c0290a9578f4e354fb242c01524329')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf $pkgname-linux.tar.gz -C "$pkgdir/usr/bin"
}
