# Maintainer: A Farzat <a@farzat.xyz>
_npmname=svg-join
_npmver=1.2.1
pkgname="$_npmname"
pkgver=1.2.1
pkgrel=1
pkgdesc="Join svg files in symbol collection."
arch=(any)
url="https://github.com/Climenty/svg-join#readme"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(fe9ce08fc8f64313f6f58abe7377582e7af26b87)

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$_npmver.tgz"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
