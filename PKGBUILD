# Maintainer: Kyle Sferrazza <aur@kylesferrazza.com>
# Contributor: John Jenkins twodopeshaggy@gmail.com

_npmname=speed-test
pkgname=speed-test
pkgver=3.0.0
pkgrel=1
pkgdesc="Test your internet connection speed and ping using speedtest.net from the CLI"
arch=(any)
url="https://github.com/sindresorhus/speed-test/"
license=(MIT)
depends=('nodejs' 'npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
