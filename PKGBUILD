_npmname=bootlint
_npmver=0.12.0
pkgname=nodejs-bootlint # All lowercase
pkgver=0.12.0
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

sha1sums=('4d23c72b48ae2e0e50225d2dd9ed7a9a51fc17c3')
sha256sums=('b2f4a31848c2d85fcc8e86a420bff8bfccbac6e8145d67cbd23e4d927ab2328c')
md5sums=('d446527c9316f014e01c23adbb6785eb')
