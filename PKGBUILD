# Maintainer: Fabius
_npmname=is-up-cli
_npmver=3.0.0
pkgname=nodejs-is-up-cli
pkgver=3.0.0
pkgrel=1
pkgdesc="Check whether a website is up or down using the isitup.org API"
arch=(any)
url="https://github.com/sindresorhus/is-up-cli"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
optdepends=()
conflicts=('nodejs-is-up')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(04ebc7bb7363f07a452463263d1c92ffd52fcd469af30bd45dbe860d4c4b932e)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
