_npmname=geojsonhint
_npmver=2.0.0
pkgname=nodejs-geojsonhint # All lowercase
pkgver=2.0.0
pkgrel=1
pkgdesc="Validate and sanity-check geojson files (geojsonlint)"
arch=(any)
url="https://github.com/mapbox/geojsonhint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('5348270ecac3c428b455cfedab245d40a5ae9fc7')
sha1sums=('054f780270f0efb69395fe8203e96098aeec0935')
