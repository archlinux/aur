_npmname=hotel
_npmver=0.4.11
pkgname=nodejs-hotel
pkgver=0.4.11
pkgrel=1
pkgdesc="local .dev domains for everyone and more."
arch=(any)
url="https://github.com/typicode/hotel"
license=("MIT")
depends=("nodejs")
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('52d4e880cadd5f4ec2d76eabf90f6ca392807cef')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
