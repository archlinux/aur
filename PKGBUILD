# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=tfsec
pkgver=0.36.7
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/liamg/tfsec"
license=('MIT')

source=("https://github.com/liamg/tfsec/releases/download/v$pkgver/tfsec-linux-amd64")
sha256sums=('4f5fbf8cb096c3e47b6b1c94698f8e983e857c8304448a36a9c8b7e4f035a17b')

package() {
    install -D -m755 $srcdir/tfsec-linux-amd64 $pkgdir/usr/bin/tfsec
}
