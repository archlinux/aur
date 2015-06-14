# Contributor: piotr rogoza < rogoza dot piotr at gmail dot com>
pkgname=perl-tie-stdscalar
pkgver=1.0.2
pkgrel=1
pkgdesc="A dummy package for Tie::StdScalar"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://www.perl.org"
depends=('perl')
source=(StdScalar.pm)

build() {
  cd ${srcdir}
  install -Dm644 StdScalar.pm ${pkgdir}/usr/share/perl5/core_perl/Tie/StdScalar.pm || return 1

}
md5sums=('86fd54cdadec099fe8dbd0b64fb34795')
