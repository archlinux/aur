# Maintainer: farwayer <farwayer@gmail.com>
pkgname=react-native-git-upgrade
pkgver=0.2.7
pkgrel=1
pkgdesc="The React Native upgrade tool"
arch=(any)
url="https://github.com/facebook/react-native/tree/master/react-native-git-upgrade"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
