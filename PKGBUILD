# Maintainer: Ryan Kes <511318+alrayyes@users.noreply.github.com>
pkgname=org-roam-to-obsidian
pkgver=3.8.2
pkgrel=1
pkgdesc="Convert org-roam notes to Obsidian markdown format"
arch=('any')
url="https://github.com/alrayyes/org-roam-to-obsidian"
license=('GPL-3.0-or-later')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alrayyes/org-roam-to-obsidian/archive/v$pkgver.tar.gz")
sha256sums=('8cd132b387c9f650f33dcb0f2c0c5f7e3248446be518530461761e1761b72bf3')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 convert.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
