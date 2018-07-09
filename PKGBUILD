_npmname=textlint-plugin-asciidoc-loose
_npmver=1.0.1
pkgname=textlint-plugin-asciidoc-loose # All lowercase
pkgver=1.0.1
pkgrel=1
pkgdesc="textlint plugin for asciidoc/asciidoctor"
arch=(any)
url="https://github.com/azu/textlint-plugin-asciidoc-loose"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(b1a47150b307b04826c562563f3624aa8c7b48f3)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
