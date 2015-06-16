# # Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=css-b64-images
pkgname=nodejs-css-b64-images # All lowercase
pkgver=0.2.5
pkgrel=1
pkgdesc="Base64 images in your css"
arch=(any)
url="https://github.com/Filirom1/css-base64-images"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('42005d83204b2b4a5d93b6b1a5644133b5927a02')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
