# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=2.1.1
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url='https://github.com/facebookincubator/create-react-app'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/create-react-app/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('6420f09348e8928e89a8ab1c58468d3ecdf61b2c554193885f16bb2a6cd9c27c6253259fb16a225df6e2bcae4ac8f9d44fc018ced7b1087f55234b414e2aa5b2')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
