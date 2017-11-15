# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=1.5.2
pkgrel=1
pkgdesc="Extract files from the RPA archive format (from Ren'Py visual novels)."
arch=("any")
url="https://github.com/Lattyware/unrpa"
license=("GPL3")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lattyware/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/Lattyware/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=("92A57AA673039A4491E6D80E5BDD8CFCA5F0551E")
sha256sums=("ef40afe59b0eab420cd0e77fa05fe2a554a87a7583d0e29befe78441089b6a9c"
            "SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m 0755 "$srcdir/$pkgname-$pkgver/unrpa" "$pkgdir/usr/bin"
}
