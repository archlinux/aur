# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=optimist
pkgname=nodejs-$_npmname
pkgver=0.6.1
pkgrel=1
pkgdesc='Light-weight option parsing with an argv hash. No optstrings attached.'
arch=(any)
url='https://github.com/substack/node-optimist'
license=(MIT)
depends=('nodejs' 'nodejs-wordwrap')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('da3ea74686fa21a19a111c326e90eb15a0196686')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir
  cd "$_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
