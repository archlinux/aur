_npmname=emoj
_npmver=0.3.0
pkgname=nodejs-emoj
pkgver=0.3.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=(any)
url="https://github.com/sindresorhus/emoj"
license=('MIT')
depends=('nodejs' 'emojione-color-font')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('9b87917bc0a1abed65f52046e5e07912f7d8532c')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
