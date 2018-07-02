# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-native-cli
pkgver=0.0.1+alpha.18
_pkgver=0.0.1-alpha.18
pkgrel=1
pkgdesc='Framework to build cross-platform native mobile apps using JavaScript'
arch=(any)
url=https://www.npmjs.com/package/vue-native-cli
license=(MIT)
depends=(create-react-native-app)
makedepends=(npm)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(42b199b5d60755da5af212a0364c198dc4c40a9437ae639d889b1262c7bf2a6dc55e562896fd42c867f068c029aaab15052912b977818820277bd71160f73c79)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$_pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
