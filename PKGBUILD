_npmname=vulcanize
pkgname=nodejs-vulcanize
pkgver=1.16.0
pkgrel=1
pkgdesc='Process Web Components into one output file'
arch=(any)
url='https://github.com/Polymer/vulcanize#readme'
license=()
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha1sums=('b0ce3b0044d194ad4908ae4f1a6c6110a6e4d5e6')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}

# vim:set ts=2 sw=2 et:
