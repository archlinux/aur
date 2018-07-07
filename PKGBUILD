# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=4.1.2
pkgrel=1
pkgdesc='Create, build, and deploy NativeScript-based projects on Android and iOS devices'
arch=(any)
url='https://www.npmjs.com/package/nativescript'
license=(Apache-2.0)
depends=(nodejs)
makedepends=(npm)
conflicts=(nativescript-cli)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(0666f24bb7a3affb19b239c6bc15de0ae88081bd6c66ef479a90615dd8bc24c363735497e9ed1b811e950a1ca8938cae32c166a5152fa336551c95e0809312c5)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
