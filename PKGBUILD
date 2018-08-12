# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=4.2.1
pkgrel=1
pkgdesc='CLI for building NativeScript apps'
arch=(any)
url=https://www.npmjs.com/package/nativescript
license=(Apache)
depends=(nodejs)
makedepends=(npm)
conflicts=(nativescript-cli)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('29b596f4c06ffa7c5efcc8854b75fa4fb1c451144d7c3e988411da2fb4eb4a9c851ef5724360502bf61877d0a76e5fa0e4a6063ff5aac3d00c68ef76283e9a25')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
