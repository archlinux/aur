# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=go-do
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple terminal to do program."
arch=('x86_64')
url="https://github.com/FryDay/go-do"
source=("https://github.com/FryDay/go-do/releases/download/v$pkgver/$pkgname-linux.tar.gz")
sha256sums=('fab4460b69c3497e3e8e0a4e97a26582618617c96845f9fbda60aa61aa90b1a3')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf $pkgname-linux.tar.gz -C "$pkgdir/usr/bin"
}
