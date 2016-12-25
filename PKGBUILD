# Maintainer: farwayer <farwayer@gmail.com>
pkgname=react-native-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="The React Native CLI tools"
arch=(any)
url="http://facebook.github.io/react-native/"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
