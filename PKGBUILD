# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=1.5.3
pkgrel=1
pkgdesc="Extract files from the RPA archive format (from Ren'Py visual novels)."
arch=("any")
url="https://github.com/Lattyware/unrpa"
license=("GPL3")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lattyware/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/Lattyware/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=("92A57AA673039A4491E6D80E5BDD8CFCA5F0551E")
sha256sums=("de05021c12ee59e91c27a528dd148c0e5ff6be496713875a8b5c25817c54d3ce"
            "SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m 0755 "$srcdir/$pkgname-$pkgver/unrpa" "$pkgdir/usr/bin"
}
