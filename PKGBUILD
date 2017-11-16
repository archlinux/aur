_npmname=hotel
_npmver=0.7.6
pkgname=nodejs-hotel
pkgver=0.7.6
pkgrel=1
pkgdesc="local .dev domains for everyone and more."
arch=(any)
url="https://github.com/typicode/hotel"
license=("MIT")
depends=("nodejs")
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('82eaed706504ef5592d9f1b3294ea55bcbe4b12d')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
