# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgrel=1
pkgname=mint
pkgver=0.3.0
pkgdesc="A refreshing language for the front-end web"
arch=(x86_64)
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/$pkgver/mint-$pkgver-linux")
sha256sums=('9fdbd17b5f1d0eeb182f020dab5d52d0d7560a0f6035552884a3a365108e7732')
noextract=("mint-$pkgver-linux")
license=('MIT')

package() {
  wget -q https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE
  install -Dm755 "mint-$pkgver-linux" "$pkgdir/usr/bin/mint"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mint/LICENSE
}
