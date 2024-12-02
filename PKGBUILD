# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=simple-system-update
pkgver=1.0.5
pkgrel=1
pkgdesc="One-click update button for Linux users"
arch=('any')
url="https://github.com/SeryogaBrigada/SimpleSystemUpdate"
license=('MIT')
depends=('curl'
         'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/SimpleSystemUpdate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2230d73892635fea77035587ef8046c8c6613e996aaaee94baea9319b7c55e77fc0c33df57b766249050c096c215211ab7dab7610dbc1f5490df0cee7d450920')

package() {
  cd "SimpleSystemUpdate-$pkgver"

  # Install files
  install -Dm755 simple-system-update "$pkgdir/usr/bin/simple-system-update"
  install -Dm644 com.github.seryogabrigada.SimpleSystemUpdate.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.SimpleSystemUpdate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
