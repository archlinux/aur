# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=simple-system-update
pkgver=1.0.6
pkgrel=1
pkgdesc="One-click update button for Linux users"
arch=('any')
url="https://github.com/SeryogaBrigada/SimpleSystemUpdate"
license=('MIT')
depends=('curl'
         'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/SimpleSystemUpdate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f6dedd366511ac3d39d3307db91ec3ff80c41bb320acfd5429bb0314d20ab110062a0ce29f1c54764447e3ee601e0413b1d8bbf2bdd5a8f79bf7c2bfd0208b49')

package() {
  cd "SimpleSystemUpdate-$pkgver"

  # Install files
  install -Dm755 simple-system-update "$pkgdir/usr/bin/simple-system-update"
  install -Dm644 com.github.seryogabrigada.SimpleSystemUpdate.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.SimpleSystemUpdate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
