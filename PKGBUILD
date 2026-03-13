# Maintainer: Gunther Schulz <https://github.com/Gunther-Schulz>
pkgname=ddc-mode-switcher
pkgver=1.0.2
pkgrel=1
pkgdesc="Switch dual-mode monitor display modes (5K↔2K) via DDC/CI — toggle or Steam wrapper"
arch=('any')
url="https://github.com/Gunther-Schulz/display-mode-switcher"
license=('MIT')
depends=('ddcutil')
optdepends=('mutter: gdctl for res/scale restore on GNOME')
source=("https://github.com/Gunther-Schulz/display-mode-switcher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f753892af3792a47aceb378470ef9c5917aea6dd37c215a7c341fe20bf4c80a')

package() {
  cd "$srcdir/display-mode-switcher-${pkgver}"
  install -Dm755 ddc-mode-switcher "$pkgdir/usr/bin/ddc-mode-switcher"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
