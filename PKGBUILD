# Maintainer: farwayer <farwayer@gmail.com>
pkgname=react-native-git-upgrade
pkgver=0.2.7
pkgrel=2
pkgdesc="The React Native upgrade tool"
arch=(any)
url="https://github.com/facebook/react-native/tree/master/react-native-git-upgrade"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $pkgname@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
