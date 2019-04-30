_npmname=pxder
_npmver=2.7.1
pkgname=nodejs-pxder # All lowercase
pkgver=2.7.1
pkgrel=1
pkgdesc="Download illusts from pixiv.net P站插画批量下载器"
arch=(any)
url="https://github.com/Tsuk1ko/pxder#readme"
license=(GPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(dc6685d140253132f4e883f4c96459a9e3cadb03)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
