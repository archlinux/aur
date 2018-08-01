# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgrel=1
pkgname=mint
pkgver=0.2.0
pkgdesc="A refreshing language for the front-end web"
arch=(x86_64)
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/$pkgver/mint-$pkgver-linux")
sha256sums=('7a43b005b7a08edc877d88143dc60f30c88e2b5043511ff0b9e0baf093281682')
noextract=("mint-$pkgver-linux")
license=('MIT')

package() {
  wget -q https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE
  install -Dm755 "mint-$pkgver-linux" "$pkgdir/usr/bin/mint"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mint/LICENSE
}
