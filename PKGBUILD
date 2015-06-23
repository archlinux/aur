# Maintainer: John Jenkins twodopeshaggy@gmail.com
_npmname=wiki-stream
pkgname=nodejs-wiki-stream
pkgver=0.0.5
pkgrel=1
pkgdesc="Automated explorer for wikipedia."
arch=(any)
url="https://github.com/joshhartigan/wiki-stream"
license=(Simplifed BSD License)
depends=('nodejs' 'npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
