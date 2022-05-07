# Maintainer: Funami
pkgname=dolphin-wezterm
pkgver=0.1.0
pkgrel=1
pkgdesc="Change the default terminal emulator for Dolphin to WezTerm"
arch=('any')
depends=('dolphin' 'wezterm')
install=dolphin-wezterm.install
source=('dolphin-open-wezterm.sh')
sha256sums=('53c595fa527837bf9816f6cb9bdc5ab8aa32e36be99b25d6f42f2033b95201c1')

package() {
  install -Dm755 "$srcdir/dolphin-open-wezterm.sh" -t "$pkgdir/usr/lib/dolphin-wezterm"
}
