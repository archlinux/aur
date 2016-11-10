# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=cypress-cli
_npmver=0.12.0
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=2
pkgdesc="CLI for Cypress.io Desktop App"
arch=(any)
url="http://www.cypress.io"
license=('MIT')
depends=('nodejs' 'cypress')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha512sums=('f9e0cb81bacf773a638d947de6ff731e01eac8304f0e4fc25c55a07b7a2eb0461e888afa1b9cca6e4a43c3260ef30853e71e347195ec4a0262b7298b4f8b65f4')

package() {
  cd "$srcdir/package"
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  install -Dm 644 readme.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
