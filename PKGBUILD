_npmname=bootlint
_npmver=0.16.2
pkgname=nodejs-bootlint
pkgver=0.16.2
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

sha256sums=('f5357b92c08bb7a07c8dca4595870afb676d2447c241638ad1bc8953a6d6be3c')
