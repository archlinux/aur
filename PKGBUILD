# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=httpjail-bin
pkgdesc='Monitor and restrict HTTP/HTTPS requests from processes'
pkgver=0.2.0
pkgrel=1
url='https://github.com/coder/httpjail'
arch=('x86_64' 'aarch64')
license=('CC0-1.0')
source_x86_64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('c66c0ca19a99176512b08e13968776133b4957534fde887774d4f29833792f0f')
sha256sums_aarch64=('c2c833ba5f0735f7f452209eaa1864253bcc85c4982996ab924a4b3cea37cefe')

package() {
    cd "$srcdir/httpjail-$pkgver-linux-$CARCH"
    install -Dm 755 httpjail $pkgdir/usr/bin/httpjail
}
