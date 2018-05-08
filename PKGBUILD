# Maintainer: samuellittley <samuel.littley@toastwaffle.com>
pkgname=create-react-native-app
pkgver=1.0.0
pkgrel=3
pkgdesc="Bootstrapping tool for React Native"
arch=(any)
url="https://github.com/react-community/create-react-native-app"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix $pkgdir/usr $pkgname@$pkgver
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
