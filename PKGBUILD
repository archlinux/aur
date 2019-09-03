# Maintainer: Fabius
_npmname=is-up-cli
_npmver=2.0.0
pkgname=nodejs-is-up-cli # All lowercase
pkgver=2.0.0
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
sha256sums=(8fd91aecb28da6b1b83edf5e59834c4c10a7187f88f5e8003c2d8779910cf014)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
