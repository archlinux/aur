# Maintainer: lmartinez-mirror
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-humantime
pkgver=1.0.0
pkgrel=1
pkgdesc='Fish plugin for making timestamps human-readable'
arch=('any')
url="https://github.com/jorgebucaran/humantime.fish"
groups=('fish-plugins')
license=('MIT')
depends=('fish')
replaces=('fish-humanize-duration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a042789a4cc1b1eb18bbd47f42fa2b188764a13868956ad32d317d05c87375e8')

package() {
  cd "humantime.fish-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
  install -Dm644 -t "$pkgdir/etc/fish/functions" functions/humantime.fish
}
