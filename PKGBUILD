# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=ardopcf-bin
pkgver=1.0.4.1.3
pkgrel=1
pkgdesc="ardopcf is an Open-Source cross-platform implmentation of Ardop"
arch=('x86_64')
url="https://github.com/pflarue/ardop"
license=('MIT')
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}::$url/releases/download/$pkgver/ardopcf_amd64_linux_64")
sha256sums_x86_64=('caf256ca1138ea992323bf8c6729a06aaaacb1b62181d0a7b2abba3dffaa9ad8')

package() {
    install -Dm 755 "../${pkgname}-${pkgver}" "$pkgdir/usr/bin/ardopcf"
}

