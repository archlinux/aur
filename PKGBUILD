# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=1.5.2
pkgrel=3
pkgdesc='Bootstrapping tool for React'
arch=(any)
url='https://github.com/facebookincubator/create-react-app'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/stf/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(be7608cec7d36aa6a2da5d3b3fdaadc61b198076f38ab0b6a26c4a99fd7ac2abe95daa3d08d0839a993e0426511258a1ec74e7fe6a4edeca1ef034d95780ec81)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
