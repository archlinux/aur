_npmname=vulcanize
pkgname=nodejs-vulcanize
pkgver=1.14.0
pkgrel=1
pkgdesc='Process Web Components into one output file'
arch=(any)
url='https://github.com/Polymer/vulcanize#readme'
license=()
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha1sums=('94da4765df53c0ce181ba4ce32330312825290b8')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}

# vim:set ts=2 sw=2 et:
