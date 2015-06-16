# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=google-image-search
pkgname=nodejs-google-image-search # All lowercase
pkgver=0.1.0
pkgrel=1
pkgdesc="Download Images from Google Image in nodejs"
arch=(any)
url="http://github.com/Filirom1/node-google-image-search"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('66d9c47d6f157223cd5576113b7a64ee3b0c62f2')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
