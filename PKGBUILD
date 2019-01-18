# Maintainer: Thiago Almeida <thiagoalmeidasa@gmail.com>
_npmname=gitlab-ci-variables-cli
_npmver=3.0.0
pkgname=nodejs-gitlab-ci-variables-cli # All lowercase
pkgver=3.0.0
pkgrel=1
pkgdesc="CLI tool to set/get pipeline variables on Gitlab CI."
arch=(any)
url="https://github.com/temando/gitlab-ci-variables-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2ab853389e3fb184c2ac253c12b95e26c50c8db4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
