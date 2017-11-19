# Maintainer: mustafagonul <mustafagonul@gmail..com>
pkgname=create-react-app
pkgver=1.0.0
pkgrel=1
pkgdesc="Create React apps with no build configuration."
arch=(any)
url="https://github.com/facebookincubator/create-react-app"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
