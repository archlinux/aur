pkgname=hyprfindr
pkgver=0.1
pkgrel=1
pkgdesc="Search and display Hyprland keybinds via CLI and desktop notifications"
arch=('any')
url="https://github.com/fwtwoo/hyprfindr"
license=('MIT')
depends=('python' 'zenity')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "hyprfindr.py" "$pkgdir/usr/bin/hyprfindr"
}
