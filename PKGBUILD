# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=geo-bash
pkgver=0.1.9
pkgrel=1
pkgdesc="A simple Bash utility for wan, lan, router, dns, mac, and ip geodata, with clean output for piping"
arch=('any')
url="https://github.com/jakewmeyer/Geo"
license=("MIT")
source=("https://github.com/jakewmeyer/Geo/archive/v0.1.9.tar.gz")
depends=("bash" "dnsutils")
sha256sums=("738a3c141c5399b8af108a58b7728e7627e4e8d1a11cbc84c8a50656735c92a2")

package() {
    tar -xf v0.1.9.tar.gz
    install -D -m755 "$srcdir/Geo-$pkgver/geo" "$pkgdir/usr/bin/geo"
    install -D -m644 "$srcdir/Geo-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}