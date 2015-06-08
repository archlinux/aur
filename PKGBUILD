# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
_npmname=optimist
pkgname=nodejs-$_npmname
pkgver=0.6.0
pkgrel=1
pkgdesc='Light-weight option parsing with an argv hash. No optstrings attached.'
arch=(any)
url='https://github.com/substack/node-optimist'
license=(MIT)
depends=('nodejs' 'nodejs-wordwrap')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('b900f399869fbddfc7bd3277994c8b83')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir
  cd "$_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
