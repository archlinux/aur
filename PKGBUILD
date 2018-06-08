# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgrel=1
pkgname=mint
pkgver=0.0.3
pkgdesc="A refreshing language for the front-end web"
arch=(x86_64)
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/$pkgver/mint-$pkgver-linux")
sha256sums=('8d54aeba208cda5e5d185b4b651a62ac87dade006873e8a0bb29081fe356558c')
noextract=("mint-$pkgver-linux")
license=('MIT')

package() {
  wget -q https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE
  install -Dm755 "mint-$pkgver-linux" "$pkgdir/usr/bin/mint"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mint/LICENSE
}
