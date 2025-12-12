# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=advanced-linux-system-cleaning
pkgver=1.0.8
pkgrel=1
pkgdesc="Advanced system cleaning and privacy"
arch=('any')
url="https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning"
license=('MIT')
optdepends=('bleachbit: additional custom options support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e5f4eef4c32e4f78c83a289d12d6542df744ef395ed5e562dd727d2e328d98ebe34fcecbef31c3bab86da3f658490e23db8442bfbf1c981b4b7ce5d18d6fe29c')

package() {
  cd "AdvancedLinuxSystemCleaning-$pkgver"

  # Install files
  install -Dm755 advanced-system-cleaning "$pkgdir/usr/bin/advanced-system-cleaning"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg "$pkgdir/usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
