_npmprefix=@mapbox
_npmname=geojsonhint
_npmver=2.1.0
pkgname=nodejs-geojsonhint # All lowercase
pkgver=2.1.0
pkgrel=1
pkgdesc="Validate and sanity-check geojson files (geojsonlint)"
arch=(any)
url="https://github.com/mapbox/geojsonhint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(https://registry.npmjs.org/$_npmprefix/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmprefix/$_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha256sums=('9067522a29396f212b5ffd592474537e9ff3151df050fc2c77f629d13fb7ac68')
