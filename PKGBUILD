# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-native-cli
pkgver=0.0.1+alpha.20
_pkgver=${pkgver/+/-}
pkgrel=1
pkgdesc='Framework to build cross-platform native mobile apps using JavaScript'
arch=(any)
url=https://www.npmjs.com/package/vue-native-cli
license=(MIT)
depends=(create-react-native-app)
makedepends=(npm)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(3d640786b19be9e2a0021161db59bd27770e18dc2238ea7bb462506651bbd3c36dd6c28b3a108b7538e0378179c14ba5c614f2abdee2bc7d150f426ed157fe98)

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$_pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
