# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=1.6
pkgrel=1
pkgdesc="Extract files from the RPA archive format (from Ren'Py visual novels)."
arch=("any")
url="https://github.com/Lattyware/unrpa"
license=("GPL3")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lattyware/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/Lattyware/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=("92A57AA673039A4491E6D80E5BDD8CFCA5F0551E")
sha256sums=("3d9669f54edbe4f3020075d8cfe5672e6e72f8df79898a1e0aaecee1e4caa9a6"
            "SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m 0755 "$srcdir/$pkgname-$pkgver/unrpa" "$pkgdir/usr/bin"
}
