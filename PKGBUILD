# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgrel=1
pkgname=mint
pkgver=0.4.0
pkgdesc="A refreshing language for the front-end web"
arch=(x86_64)
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/$pkgver/mint-$pkgver-linux")
sha256sums=('e82ebb817094fb209bbba0977d0e275659b949e58175147b3657ccbcd3b4e2ef')
noextract=("mint-$pkgver-linux")
license=('MIT')

package() {
  wget -q https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE
  install -Dm755 "mint-$pkgver-linux" "$pkgdir/usr/bin/mint"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mint/LICENSE
}
