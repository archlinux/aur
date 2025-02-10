# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=simple-system-update
pkgver=1.0.7
pkgrel=1
pkgdesc="One-click update button for Linux users"
arch=('any')
url="https://github.com/SeryogaBrigada/SimpleSystemUpdate"
license=('MIT')
depends=('curl'
         'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/SimpleSystemUpdate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3e3abde3df19eaec802eb5727ea12d8d5e557ed27f3013a545401938a043a373199ea2214cbea7cc4ab2a7a88f4dfeaea808519d26010947ec5675267cd2bc84')

package() {
  cd "SimpleSystemUpdate-$pkgver"

  # Install files
  install -Dm755 simple-system-update "$pkgdir/usr/bin/simple-system-update"
  install -Dm644 com.github.seryogabrigada.SimpleSystemUpdate.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.SimpleSystemUpdate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
