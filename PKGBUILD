# Maintainer: Your Name <your@email.com>
# Contributor: ...

pkgname=opencode-bwrap
pkgver=1.0.0
pkgrel=2
pkgdesc='Run opencode inside a bubblewrap sandbox for filesystem isolation'
arch=('x86_64' 'aarch64')
url='https://github.com/didvc/opencode-bwrap'
license=('MIT')
depends=('opencode' 'bubblewrap')
source=("opencode-bwrap" "README.md")
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/opencode-bwrap" "$pkgdir/usr/bin/opencode-bwrap"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
