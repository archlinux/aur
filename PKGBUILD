# Maintainer: John Jenkins twodopeshaggy@gmail.com

_npmname=psdinfo
pkgname=nodejs-psdinfo
pkgver=1.0.2
pkgrel=1
pkgdesc="Inspect PSD files from the command line"
arch=(any)
url="https://github.com/rstacruz/psdinfo"
license=(Simplifed BSD License)
depends=('nodejs' 'npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
