pkgname=nodejs-ajv-cli # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=0.9.0
pkgrel=1
pkgdesc="A command line interface for epoberezkin/ajv JSON schema validator"
arch=(any)
url="https://github.com/jessedc/ajv-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha1sums=(42b098df6ecd4cdaa488c3c1d51ca42a4ce541fd)

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$pkgver
}

