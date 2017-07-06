# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=geo-bash
pkgver=1.2.0
pkgrel=2
pkgdesc="A simple Bash utility for wan, lan, router, dns, mac, and ip geodata, with clean output for piping"
arch=('any')
url="https://github.com/jakewmeyer/Geo"
license=("MIT")
source=("https://github.com/jakewmeyer/Geo/archive/v$pkgver.tar.gz")
depends=("bash" "dnsutils")
sha256sums=("6a4f5fe6cfa527af4bacaba3e62d44d4a8dac5beaa74d2f5dc5e8a38b70acb09")

package() {
    tar -xf v$pkgver.tar.gz
    install -D -m755 "$srcdir/Geo-$pkgver/geo" "$pkgdir/usr/bin/geo"
    install -D -m644 "$srcdir/Geo-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}