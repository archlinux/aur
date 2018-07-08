_npmname=remark-validate-links
_npmver=7.0.0
pkgname=remark-validate-links # All lowercase
pkgver=7.0.0
pkgrel=1
pkgdesc="Validate links to headings and files in markdown"
arch=(any)
url="https://github.com/wooorm/remark-validate-links#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(31de803ac4682ea923b68a82560810981853d110)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
