# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=go-do
pkgver=0.2.0
pkgrel=3
pkgdesc="Simple terminal to do program."
arch=('x86_64')
url="https://github.com/FryDay/go-do"
source=("https://github.com/FryDay/go-do/releases/download/v$pkgver/$pkgname-linux.tar.gz")
sha256sums=('d8f7f47f0eaac63ddd553083dec97fdff7fe48a5b9d5d94ae586ba860c484f96')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf $pkgname-linux.tar.gz -C "$pkgdir/usr/bin"
}
