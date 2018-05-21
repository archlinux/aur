# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>

_npmname=@storybook/cli
_npmver=3.4.5
pkgname=nodejs-storybook-cli # All lowercase
pkgver=3.4.5
pkgrel=1
pkgdesc="Storybook's CLI - easiest method of adding storybook to your projects"
arch=(any)
url="https://github.com/storybooks/storybook/tree/master/lib/cli"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(118d734973145fadcd619c1efb42ccdd6073a835)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
