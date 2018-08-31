# Maintainer: Jasper Van der Jeugt <jasper@fugue.co>
pkgname=patat-bin
pkgver='0.8.0.0'
pkgrel=1
pkgdesc="Terminal-based presentations using Pandoc"
arch=('x86_64')
url="https://github.com/jaspervdj/patat"
license=('GPL2')
depends=('gmp')
makedepends=('gzip')
source=("https://github.com/jaspervdj/patat/releases/download/v$pkgver/patat-v$pkgver-linux-x86_64.tar.gz")
md5sums=('74a9145ecb5c97a406c6ac56c240b4a7')
options=('!strip')

package() {
    local srcdir="patat-v$pkgver-linux-x86_64"

    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/patat" "$pkgdir/usr/bin/patat"

    mkdir -p "$pkgdir/usr/share/man/man1"
    cp "$srcdir/patat.1" "$pkgdir/usr/share/man/man1/patat.1"
}
