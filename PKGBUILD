# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=4.1.0
pkgrel=1
pkgdesc='Create, build, and deploy NativeScript-based projects on iOS and Android devices'
arch=(any)
url='https://www.npmjs.com/package/nativescript'
license=(Apache)
depends=(nodejs)
makedepends=(npm)
conflicts=(nativescript-cli)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(ad9e43db109b183a2b084c69c50293f2fb783cd7430e05ad7b29902e983fb428f6d23973dd1f59c5aa22578244ba66c081d06304425f05db067194ef62ff9183)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
