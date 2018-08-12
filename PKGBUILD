# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-native-cli
pkgver=0.0.2
pkgrel=1
pkgdesc='Framework for building cross-platform native mobile apps using Vue'
arch=(any)
url=https://www.npmjs.com/package/vue-native-cli
license=(MIT)
depends=(create-react-native-app)
makedepends=(npm)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('22e957d49455398ecec13d82e8529f9c9f24255aac3211ddd6c7e8dabbee988c4df6717cec13f926d96f5c665e7304411054ab53bb545b0320822a3da8c07a94')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
