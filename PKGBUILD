# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=advanced-linux-system-cleaning
pkgver=1.0.9
pkgrel=1
pkgdesc="Advanced system cleaning and privacy"
arch=('any')
url="https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning"
license=('MIT')
optdepends=('bleachbit: additional custom options support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('49f0d948e97d3b9115b534801e70086bf52f789f4d1018be5117d7b70427506eebbd662955699dff154deaae928b2e54503ba39b5af2b9ef8136263c87c32d06')

package() {
  cd "AdvancedLinuxSystemCleaning-$pkgver"

  # Install files
  install -Dm755 advanced-system-cleaning "$pkgdir/usr/bin/advanced-system-cleaning"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop"
  install -Dm644 com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg "$pkgdir/usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
