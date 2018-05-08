# Maintainer: samuellittley <samuel.littley@toastwaffle.com>
pkgname=create-react-native-app
pkgver=1.0.0
pkgrel=2
pkgdesc="Bootstrapping tool for React Native"
arch=(any)
url="https://github.com/react-community/create-react-native-app"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')

package() {
  cd $srcdir
  local _npmdir=$pkgdir/usr/lib/node_modules
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix $pkgdir/usr $pkgname@$pkgver
}
