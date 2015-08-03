_npmname=is-up
_npmver=1.0.1
pkgname=nodejs-is-up # All lowercase
pkgver=1.0.1
pkgrel=1
pkgdesc="Check whether a website is up or down"
arch=(any)
url="https://github.com/sindresorhus/is-up"
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(daf421391a2c2fec43e8eb0ba28facba58be3d3c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
