# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=4.2.2
pkgrel=1
pkgdesc='CLI for building NativeScript apps'
arch=(any)
url=https://www.npmjs.com/package/nativescript
license=(Apache)
depends=(nodejs)
makedepends=(npm)
conflicts=(nativescript-cli)
options=(!emptydirs)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('c27d7e85ef811f24acefcd208a5069f8ad87dad870e12fae1d8ddc74d8d7f7669f90a3e0debcccabda42cbf0fbff137efff18d0dfb7b5bf987498b65377010ff')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
