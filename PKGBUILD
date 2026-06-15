# Maintainer: IRRatium <https://github.com/IRRatium>
pkgname=stockings
pkgver=1.0.0
pkgrel=1
pkgdesc="A harmless joke package: opens your browser to search Google for 'buy stockings' once, on install"
arch=('any')
url="https://github.com/IRRatium/stockings-aur"
license=('MIT')
depends=('xdg-utils')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cat <<'EOF'

   ┌──────────────────────────────────────────────┐
   │   stockings.aur — a tiny joke package        │
   │                                              │
   │   no binaries, no daemons, no telemetry      │
   │   on install: one google search opens once   │
   │   on remove:  nothing happens, you're free   │
   │                                              │
   │   thank you for shopping responsibly :)      │
   └──────────────────────────────────────────────┘

EOF
}

package() {
    cd "$srcdir/stockings-aur-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
