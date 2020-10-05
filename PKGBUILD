# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=7.0.10
pkgrel=1
pkgdesc='CLI for building NativeScript apps'
arch=(any)
url=https://www.npmjs.com/package/nativescript
license=(Apache)
depends=(nodejs)
makedepends=(npm)
optdepents=(android-sdk: for native Android development)
conflicts=(nativescript-cli)
options=(!emptydirs)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha512sums=('b4eebcddb91d6faef7709652aa001b658ac1f8f1e60e20f238da4129f2a083f57c853ab64c54fca97934dc06684458554991421caa27eef2e1c7f7797ebce809')
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
