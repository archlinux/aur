_npmname=remark-lint
_npmver=9.1.1
pkgname=remark-lint # All lowercase
pkgver=9.1.1
pkgrel=1
pkgdesc="Lint markdown with remark"
arch=(any)
url="https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(96721093994dbedbcf070b6205f08331063a8158be07d12a2e05ef7c746a2321)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
