# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=advanced-linux-system-cleaning
pkgver=1.0.3
pkgrel=1
pkgdesc="Advanced system cleaning and privacy"
arch=('any')
url="https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning"
license=('MIT')
optdepends=('bleachbit: additional custom options support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('36802dc363416491692100bf76835e2df67b3c3daf7d3dc0d89ab1dc3dfb67861ff8ad5035c8bd727b6142f1d673104f43a42ff499a23b43245717473d75f52a')

package() {
  cd "AdvancedLinuxSystemCleaning-$pkgver"

  # Install files
  install -Dm755 advanced-system-cleaning "$pkgdir/usr/bin/advanced-system-cleaning"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg "$pkgdir/usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
