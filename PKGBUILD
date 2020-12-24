# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=tfsec
pkgver=0.36.10
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/liamg/tfsec"
license=('MIT')

source=("https://github.com/liamg/tfsec/releases/download/v$pkgver/tfsec-linux-amd64")
sha256sums=('7ab05dab653c24d488b0aaf4f1e8239baba4d2c03bf27cedfb153052f8704bc5')

package() {
    install -D -m755 $srcdir/tfsec-linux-amd64 $pkgdir/usr/bin/tfsec
}
