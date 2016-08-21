# Maintainer: Arnau Sanchez <pyarnau@gmail.com>
_npmname=js-beautify
_npmver=1.6.3
pkgname=js-beautify # All lowercase
pkgver=1.6.3
pkgrel=2
pkgdesc="Beautify JavaScript/JSON (jsbeautifier.org)"
arch=(any)
license=('MIT')
url="http://jsbeautifier.org/"
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=(b26cc97c822f7add0247444e08fb95f4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
