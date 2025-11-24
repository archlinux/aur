pkgname=rice-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for switching and managing RICE for your linux desktop"
arch=('any')
url="https://github.com/S1rEx1/Rice-Switcher"
license=('MIT')
depends=('bash' 'jq' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/S1rEx1/Rice-Switcher/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
  cd "Rice-Switcher-main"
  install -Dm755 config_switcher.sh "$pkgdir/usr/bin/rice-switcher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
