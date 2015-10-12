# Maintainer: Aaron Reichenbach <aaron@ar0x29a.net>
pkgname=perl-psed
pkgver=5.20.3
pkgrel=1
pkgdesc="A perl stream editor."
arch=(i686 x86_64)
url="https://www.perl.org/"
license=('GPL')
depends=(perl)
source=(http://cpansearch.perl.org/src/SHAY/perl-5.20.3/x2p/s2p.PL)
md5sums=('f9fa95fcc1da19dc773b820909c0d290')

build() {
  perl s2p.PL
}

package() {
  mkdir -pv "$pkgdir/usr/bin/vendor_perl/"
  mv -v psed "$pkgdir/usr/bin/vendor_perl/"
  mv -v s2p "$pkgdir/usr/bin/vendor_perl/"
}
