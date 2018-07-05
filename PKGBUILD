# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgrel=1
pkgname=mint
pkgver=0.1.0
pkgdesc="A refreshing language for the front-end web"
arch=(x86_64)
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/$pkgver/mint-$pkgver-linux")
sha256sums=('1f536c2b6239e2a151ae0bc21f3897d7563da5075d7208e01eb6f3b6d6bfa5a2')
noextract=("mint-$pkgver-linux")
license=('MIT')

package() {
  wget -q https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE
  install -Dm755 "mint-$pkgver-linux" "$pkgdir/usr/bin/mint"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mint/LICENSE
}
