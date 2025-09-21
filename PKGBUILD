# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=httpjail-bin
pkgdesc='Monitor and restrict HTTP/HTTPS requests from processes'
pkgver=0.3.0
pkgrel=1
url='https://github.com/coder/httpjail'
arch=('x86_64' 'aarch64')
license=('CC0-1.0')
source_x86_64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('15d63f3cfcdb6f41b34033aec3dbceb0fffb11c5b7a9a23693c4690a6f52861d')
sha256sums_aarch64=('122d8ea8ef3f89f162672ba42a5b79ec11dccceb8aa9809202907f14cf9dcd77')

package() {
    cd "$srcdir/httpjail-$pkgver-linux-$CARCH"
    install -Dm 755 httpjail $pkgdir/usr/bin/httpjail
}
