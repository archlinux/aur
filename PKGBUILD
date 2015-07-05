# Contributors:
# henning mueller <henning@orgizm.net>

pkgname=arsch-keyring
pkgver=20120607
pkgrel=1
pkgdesc='The arsch repository keyring.'
url='http://arsch.orgizm.net'
arch=(any)
license=(GPL)
install=${pkgname}.install
conflicts=(arsch)
replaces=(arsch)

source=(
  arsch-keyring.install
  arsch.gpg
  arsch-trusted
  arsch-revoked
)

md5sums=(
  2706dfb779a4ff4d35ec055a71ab21ea
  caaaa07f5322ed807465c707c47fe9d7
  f06139bb5ab592082192bfd129caa019
  d41d8cd98f00b204e9800998ecf8427e
)

package() {
  _d=usr/share/pacman/keyrings
  mkdir -p $pkgdir/$_d
  install -m 644 $srcdir/arsch* $pkgdir/$_d
}
