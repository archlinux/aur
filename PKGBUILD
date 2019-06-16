_npmname=ffmpeg-concat
_npmver=1.0.13
pkgname=nodejs-ffmpeg-concat # All lowercase
pkgver=1.0.13
pkgrel=1
pkgdesc="Concats a list of videos together using ffmpeg with sexy OpenGL transitions."
arch=(any)
url="https://github.com/transitive-bullshit/ffmpeg-concat"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a8e3bfdbf7491e9dbf5496b1ee404146051c7079)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
