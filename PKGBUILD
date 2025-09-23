# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=httpjail-bin
pkgdesc='Monitor and restrict HTTP/HTTPS requests from processes'
pkgver=0.4.0
pkgrel=1
url='https://github.com/coder/httpjail'
arch=('x86_64' 'aarch64')
license=('CC0-1.0')
source_x86_64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('5d7f49079a685b5aa8c47da52e69d08f5a66cf85b28d2156ca98155776a4ce32')
sha256sums_aarch64=('b9bcc86f1285c972449f5dd800661f6b41674c307ef7ae07d5934742ee8d1e17')

package() {
    cd "$srcdir/httpjail-$pkgver-linux-$CARCH"
    install -Dm 755 httpjail $pkgdir/usr/bin/httpjail
}
