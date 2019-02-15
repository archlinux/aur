# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=2.1.5
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebookincubator/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-create-react-app)
options=(!strip)

package() {
  npm i -g --prefix "$pkgdir"/usr create-react-app@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}

