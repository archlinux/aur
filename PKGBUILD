# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=1.5.2
pkgrel=2
pkgdesc='Bootstrapping tool for React'
arch=(any)
url='https://github.com/facebookincubator/create-react-app'
license=(MIT)
depends=(nodejs)
makedepends=(npm)

package() {
  npm install -g --prefix $pkgdir/usr $pkgname@$pkgver
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
