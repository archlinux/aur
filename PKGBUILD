_npmname=bootlint
_npmver=0.15.1
pkgname=nodejs-bootlint # All lowercase
pkgver=0.15.1
pkgrel=1
pkgdesc="HTML linter for Bootstrap projects"
arch=(any)
url="https://github.com/twbs/bootlint"
license=(MIT)
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

sha256sums=('acf64b125dbf8f1adaae01b116d80eb411ce776ea2b80b2f64c085f1ef0ff3aa')
