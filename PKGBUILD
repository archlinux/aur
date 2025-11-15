# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=httpjail-bin
pkgdesc='Monitor and restrict HTTP/HTTPS requests from processes'
pkgver=0.5.1
pkgrel=1
url='https://github.com/coder/httpjail'
arch=('x86_64' 'aarch64')
license=('CC0-1.0')
source_x86_64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('807832e86786bf40d48ba1373f49cfa3cdbccff91dd57bb203644cab787df024')
sha256sums_aarch64=('640f641840f6ca5c05d04cd06ed4f2f62f70c9cc68c4d9f6be0b512537fa8ee1')

package() {
    cd "$srcdir/httpjail-$pkgver-linux-$CARCH"
    install -Dm 755 httpjail $pkgdir/usr/bin/httpjail
}
