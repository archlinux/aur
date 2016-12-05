_npmname=emoj
_npmver=0.4.0
pkgname=nodejs-emoj
pkgver=0.4.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=(any)
url="https://github.com/sindresorhus/emoj"
license=('MIT')
depends=('nodejs' 'emojione-color-font')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('0d551065b180ff476b7b109a5c3116a89ded5ea8')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
