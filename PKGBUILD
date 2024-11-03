# Maintainer: Teoman Ata Korkmaz <teoata17@gmail.com>
pkgname=ismycomputeronrightnow
pkgver=1.0
pkgrel=1
pkgdesc="A script that confirms if your computer is on"
arch=('any')
license=('MIT')
source=("$pkgname.sh")  # Source points to the script we created
sha256sums=('SKIP')     # Skip checksum since it’s a simple local file

package() {
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

