_npmname=glslify
_npmver=5.0.2
pkgname=nodejs-glslify # All lowercase
pkgver=5.0.2
pkgrel=1
pkgdesc="A node.js-style module system for GLSL!"
arch=(any)
url="https://github.com/stackgl/glslify"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(42851ab96f1f9f87ccaa1310ae467790884d685c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
