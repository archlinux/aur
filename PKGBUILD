_npmname=nomnoml-cli
_npmver=0.2.3
pkgname=nodejs-nomnoml-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="Generates images from nomnoml diagram sources on the command line"
arch=(any)
url="https://github.com/prantlf/nomnoml-cli"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(bb0cc08215a71714325e0fe82b5bc5a144f725c9)

build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

package(){
	:
}
