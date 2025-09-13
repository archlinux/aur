# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=advanced-linux-system-cleaning
pkgver=1.0.7
pkgrel=1
pkgdesc="Advanced system cleaning and privacy"
arch=('any')
url="https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning"
license=('MIT')
optdepends=('bleachbit: additional custom options support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('92809fb56f22015cf07e33025fc2fc9dbe366a91a58f8013c3510464bfe1537665f5460a659dc9bfb3c1174f578c0b4a7e25774da1bfde314c47355860417506')

package() {
  cd "AdvancedLinuxSystemCleaning-$pkgver"

  # Install files
  install -Dm755 advanced-system-cleaning "$pkgdir/usr/bin/advanced-system-cleaning"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg "$pkgdir/usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
