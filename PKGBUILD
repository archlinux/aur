# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-conventional-changelog
_npmver=2.1.0
pkgname=nodejs-cz-conventional-changelog
pkgver=2.1.0
pkgrel=1
pkgdesc="Commitizen plugin for conventional changelogs commit messages"
arch=(any)
url="https://github.com/commitizen/cz-conventional-changelog"
license=(MIT)
depends=('nodejs' 'npm' 'nodejs-commitizen')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('4cc8e44abbe3bb97cf415f87a3c4c88a80205e4972f21def27fb7189ccc9ae551a2e980c180eacb27c2ab8b316ccd659c82b092b9af890f830768842e1400699')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:<Paste>
