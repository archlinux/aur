# Maintainer: farwayer <farwayer@gmail.com>
pkgname=react-native-cli
pkgver=2.0.1
pkgrel=2
pkgdesc="The React Native CLI tools"
arch=(any)
url="http://facebook.github.io/react-native/"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $pkgname@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
