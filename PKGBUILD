# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-native-cli
pkgver=0.0.1
pkgrel=1
pkgdesc='Framework to build cross-platform native mobile apps using JavaScript'
arch=(any)
url=https://www.npmjs.com/package/vue-native-cli
license=(MIT)
depends=(create-react-native-app)
makedepends=(npm)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(ebd65713d63edd8c76ff1894f541292b225ec7a88dc4a6c968613435fa915825b59c887ee7003ed6c55c21748b832bc70cacac3cc816465c45aa4d86239feb1c)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
