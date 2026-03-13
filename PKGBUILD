# Maintainer: Gunther Schulz <https://github.com/Gunther-Schulz>
pkgname=ddc-mode-switcher
pkgver=1.0.1
pkgrel=1
pkgdesc="Switch dual-mode monitor display modes (5K↔2K) via DDC/CI — toggle or Steam wrapper"
arch=('any')
url="https://github.com/Gunther-Schulz/display-mode-switcher"
license=('MIT')
depends=('ddcutil' 'mutter')
source=("https://github.com/Gunther-Schulz/display-mode-switcher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42b877450959907045fe68fd8cf01df95bf9a990eca39c6d9a74fcf273893e5d')

package() {
  cd "$srcdir/display-mode-switcher-${pkgver}"
  install -Dm755 ddc-mode-switcher "$pkgdir/usr/bin/ddc-mode-switcher"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
