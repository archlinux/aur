# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=go-do
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple terminal to do program."
arch=('x86_64')
url="https://github.com/FryDay/go-do"
source=("https://github.com/FryDay/go-do/releases/download/v$pkgver/$pkgname-linux.tar.gz")
sha256sums=('95ec44432cb36de687c52609368ec6c89a51001dfbc4c336a05b25e9502c5b77')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf $pkgname-linux.tar.gz -C "$pkgdir/usr/bin"
}
