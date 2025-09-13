pkgname=hottgo-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Hypergraph & HoTT tooling in Go (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/watchthelight/HypergraphGo"
license=('MIT')
provides=('hottgo')
conflicts=('hottgo')
depends=()
source_x86_64=("https://github.com/watchthelight/HypergraphGo/releases/download/v${pkgver}/hottgo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/watchthelight/HypergraphGo/releases/download/v${pkgver}/hottgo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 hottgo -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
