# Maintainer: Sajjad 'MCSH' Heydari <mcshemail@gmail.com>
pkgname=ignite-cli
pkgver=3.5.1
pkgrel=1
pkgdesc="ignite cli tool for react native"
arch=(any)
url="https://github.com/infinitered/ignite"
license=('MIT')
depends=('nodejs' 'react-native-cli')
makedepends=('npm')

package() {
  npm install -g --prefix $pkgdir/usr $pkgname@$pkgver
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
