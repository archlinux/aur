# Maintainer: André Kugland <kugland@gmail.com>
pkgname=expo-create-react-native-app
pkgver=3.6.0
pkgrel=2
pkgdesc="The fastest way to create universal React Native apps"
arch=(any)
url="https://github.com/expo/create-react-native-app"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" create-react-native-app@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
