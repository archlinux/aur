# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=2.1.3
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebookincubator/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-create-react-app)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('6c6c7abd854464bdfd41954fe3abb81ce87781acea39cc96fdd2d65c53517666a22fb301c4e6e8d07de8c642bf63306a154bc9fbe1209dc59aad0af63e710afb')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
