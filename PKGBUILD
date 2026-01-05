pkgname=hypergraphgo-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Hypergraph & HoTT tooling in Go - CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/watchthelight/HypergraphGo"
license=('MIT')
provides=('hg')
conflicts=('hg')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/watchthelight/HypergraphGo/releases/download/v$pkgver/hg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/watchthelight/HypergraphGo/releases/download/v$pkgver/hg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "$srcdir/hg" "$pkgdir/usr/bin/hg"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
