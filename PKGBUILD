# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=advanced-linux-system-cleaning
pkgver=1.0.4
pkgrel=1
pkgdesc="Advanced system cleaning and privacy"
arch=('any')
url="https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning"
license=('MIT')
optdepends=('bleachbit: additional custom options support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('af77ec97993ddfd80d62127c11982766092114b8689d1e23daf2b6a7c476ee7cf422cdd884b8a1d725a7fc970ddcc56675a1fb0153c9c27746bbf3fbd903652a')

package() {
  cd "AdvancedLinuxSystemCleaning-$pkgver"

  # Install files
  install -Dm755 advanced-system-cleaning "$pkgdir/usr/bin/advanced-system-cleaning"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg "$pkgdir/usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
