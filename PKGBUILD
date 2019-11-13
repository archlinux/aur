# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=tfsec
pkgver=0.12.0
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/liamg/tfsec"
license=('MIT')

source=("https://github.com/liamg/tfsec/releases/download/v$pkgver/tfsec-linux-amd64")
sha256sums=('473126fe588293db34b8084c939932a6c30196613c915839157d7da9d793cab4')

package() {
    install -D -m755 $srcdir/tfsec-linux-amd64 $pkgdir/usr/bin/tfsec
}
