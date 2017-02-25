_npmprefix=@mapbox
_npmname=geojsonhint
_npmver=2.0.1
pkgname=nodejs-geojsonhint # All lowercase
pkgver=2.0.1
pkgrel=1
pkgdesc="Validate and sanity-check geojson files (geojsonlint)"
arch=(any)
url="https://github.com/mapbox/geojsonhint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/@_npmprefix/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmprefix/$_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('32dac7300f04b3ebaec74b5ba9853dfb42532354')
sha512sums=('82ff6a864938a9acb581d784f623df31768ec65b54b71ace809fe915563a0473ec55225b95026158cd4a2ef8776dd19b6bcaa6b4802dd624dd87897834080e73')
