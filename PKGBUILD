_npmname=mapscii
_npmver=0.3.1
pkgname=nodejs-mapscii # All lowercase
pkgver=0.3.1
pkgrel=2
pkgdesc="Map+Ascii -> MapSCII! Console Map Viewer."
arch=(any)
url="https://github.com/rastapasta/mapscii#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(3d522267a0067849f81fedf4dc783a2e11d4072b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
