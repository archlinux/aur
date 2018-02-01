_npmname=osmtogeojson
_npmver=3.0.0-beta.3
pkgname=nodejs-osmtogeojson # All lowercase
pkgver=3.0.0b3
pkgrel=1
pkgdesc="Convert OSM data to GeoJSON"
arch=(any)
url="https://github.com/tyrasd/osmtogeojson#readme"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(480b6bfc68ae2192163fe77b35d80416fefb5b90)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('499f91feaa612ec845df420f107e2e6bc28f0563')
