# Maintainer: Thiago Almeida <thiagoalmeidasa@gmail.com>
_npmname=commitlint
_npmver=7.2.1
pkgname=nodejs-commitlint # All lowercase
pkgver=7.2.1
pkgrel=1
pkgdesc="Lint your commit messages"
arch=(any)
url="https://github.com/marionebl/commitlint#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c1d50a26bf2324b60a0f67507b20dc0a74976a8c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
