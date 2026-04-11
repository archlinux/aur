# Maintainer: ivanimmanuel-dev <https://github.com/ivanimmanuel-dev>
pkgname=hypr-dashboard
pkgver=1.1.0
pkgrel=1
pkgdesc="A Hyprland Dashboard script that tiles btop, glava, fastfetch, and tty-clock"
arch=('any')
url="https://github.com/ivanimmanuel-dev/Hypr-Dashboard"
license=('MIT')
depends=('hyprland' 'kitty' 'btop' 'fastfetch' 'glava' 'tty-clock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ivanimmanuel-dev/Hypr-Dashboard/archive/refs/tags/v1.1.0.tar.gz")
sha256sums=('65c43fed825fe0bbf42d6454531bc55a15512384d8b98ca82519b5c2b5ec0392')

package() {
  cd "$srcdir/Hypr-Dashboard-1.1.0"
  install -Dm755 dashboard.sh "$pkgdir/usr/local/bin/hypr-dashboard"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
