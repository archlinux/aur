# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=weex-toolkit
pkgver=2.0.0+beta.20
pkgrel=1
pkgdesc='Official CLI for working with Apache Weex'
arch=(any)
url=https://github.com/weexteam/weex-toolkit
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(weex)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-${pkgver/+/-}.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('35311eeb77c7b57d8ebe73a828979c3370be943a9425c3e28b9950f01b17779b6d66d92aa01b90283f33fa5db24055b124facf9a64d946360eb35fa655372d3c')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-${pkgver/+/-}.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
