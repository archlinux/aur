# Maintainer: Fabius
_npmname=is-up-cli
_npmver=4.0.0
pkgname=nodejs-is-up-cli
pkgver=4.0.0
pkgrel=1
pkgdesc="Check whether a website is up or down using the isitup.org API"
arch=(any)
url="https://github.com/sindresorhus/is-up-cli"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(073cc281e5e9d6c0fbd6148b4a153b8f9b3a857c0da88c365b0daff54970c5bd)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
