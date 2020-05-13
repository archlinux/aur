# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nodejs-ajv-cli # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=3.1.0
pkgrel=1
pkgdesc="A command line interface for epoberezkin/ajv JSON schema validator"
arch=(any)
url="https://github.com/jessedc/ajv-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha1sums=('00e04c436c90ccc0883d31f21879ed932a774b19')

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$pkgver
}

