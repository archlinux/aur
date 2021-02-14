# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=go-do
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple terminal to do program."
arch=('x86_64')
url="https://github.com/FryDay/go-do"
source=("https://github.com/FryDay/go-do/releases/download/v$pkgver/$pkgname-linux.tar.gz")
sha256sums=('9a799d1218b68616a49ceec0f5407e2646ed363d933f364240d8420d0efe63bb')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf $pkgname-linux.tar.gz -C "$pkgdir/usr/bin"
}
