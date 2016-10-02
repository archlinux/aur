_npmname=glslify
_npmver=6.0.0
pkgname=nodejs-glslify # All lowercase
pkgver=6.0.0
pkgrel=1
pkgdesc="A node.js-style module system for GLSL!"
arch=(any)
url="https://github.com/stackgl/glslify"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
sha1sums=('b44a9a4d7fda37103645cd3d3edbed1d97abd16b')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
