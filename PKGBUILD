# Maintainer: Will Price <will.price94+aur@gmail.com>
_npmname=livedown
_npmver=1.0.11
pkgname=nodejs-livedown # All lowercase
pkgver=1.0.11
pkgrel=1
pkgdesc="Live Markdown previews for your favourite editor."
arch=(any)
url="https://github.com/shime/livedown"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
md5sums=('8e812562fd84b991af3b992201133598')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:

# vim:set ts=2 sw=2 et:
