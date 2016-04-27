_npmname=gulp-server-livereload
_npmver=1.7.4
pkgname=nodejs-gulp-server-livereload # All lowercase
pkgver=1.7.4
pkgrel=1
pkgdesc="Gulp plugin to run a local webserver with livereload enabled via socket.io"
arch=(any)
url="https://github.com/hiddentao/gulp-server-livereload"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(66b4a0f63b0db7455b636e759db406dbeee5f3e1)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
