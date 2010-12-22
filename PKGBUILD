# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=perl-rpsl-parser
pkgver=0.04000
pkgrel=1
pkgdesc="Router Policy Specification Language (RFC2622) Parser"
arch=(any)
url="http://search.cpan.org/~lmc/RPSL-Parser/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0', 'perl-class-accessor>=0.31')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/L/LM/LMC/RPSL-Parser-$pkgver.tar.gz)
md5sums=(f4344b0258b7d55dd5e0923a1fcda33d)

build() {
  cd "$srcdir/RPSL-Parser-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
  perl Build install
}

# vim:set ts=2 sw=2 et:
