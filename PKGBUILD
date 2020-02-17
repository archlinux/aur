# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=tfsec
pkgver=0.19.0
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/liamg/tfsec"
license=('MIT')

source=("https://github.com/liamg/tfsec/releases/download/v$pkgver/tfsec-linux-amd64")
sha256sums=('88541fc654dea8f3514c9422003df870f985dc3c50a43c929ab44bb5cee60789')

package() {
    install -D -m755 $srcdir/tfsec-linux-amd64 $pkgdir/usr/bin/tfsec
}
