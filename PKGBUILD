# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=4.0.1
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
sha512sums=(764c0e1261bf819757ba17867f2e2dd3cdf02e06835ded3163effb2692ee36b368eec053233e4f1b69bc273a3442745419680a9f2603d3b3667a58fffce02511)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
