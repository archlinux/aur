# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=uglifycss
pkgname=nodejs-uglifycss
pkgver=0.0.11
pkgrel=1
pkgdesc="Port of YUI CSS Compressor from Java to NodeJS."
arch=('any')
url="https://github.com/fmarcia/UglifyCSS"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('78621ebf7544e1ad37ab3814e7318c1ae777922d')
# vim:set ts=2 sw=2 et:
