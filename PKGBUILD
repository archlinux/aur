# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: Luís Ferreira <org dot aurorafoss at luis, backwards>
# Contributor: Carlo Capocasa <carlo@capocasa.net>

pkgname=i3-battery-popup
pkgver=1.1.1
pkgrel=1
pkgdesc="Show messages to the user when the battery is almost empty"
arch=(any)
url="https://github.com/rjekker/i3-battery-popup"
license=('MIT')
provides=('i3-battery-popup-git')
conflicts=('i3-battery-popup-git')
depends=('bash')
optdepends=('tk: for tk dialogs support')
source=("$pkgname-$pkgver::https://github.com/rjekker/i3-battery-popup/archive/v$pkgver.tar.gz")
sha512sums=('a9381bef3f804971d64bca832b15ac8353bb100dad9f24d0f800cbe7e15eb4ad81509c35c460e1217be0205d84d4462c86f119b7ed0fc397326ea0bc65fd6d4e')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 755 i3-battery-popup "$pkgdir/usr/bin/i3-battery-popup"
}
