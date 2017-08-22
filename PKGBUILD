_npmname=unsplash-wallpaper
_npmver=6.1.0
pkgname=nodejs-unsplash-wallpaper # All lowercase
pkgver=6.1.0
pkgrel=1
pkgdesc="Set an image from Unsplash as your wallpaper."
arch=(any)
url="https://github.com/cuth/unsplash-wallpaper#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c7dca9c14b2e427a4574f4dac50524fe8891d655)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
