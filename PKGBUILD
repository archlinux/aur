# CPAN Name  : Algorithm::Permute
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-algorithm-permute
pkgver=0.12
pkgrel=2
pkgdesc='Perl package for handy and fast permutations with object oriented interface'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Algorithm-Permute'
license=('GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/E/ED/EDPRATOMO/Algorithm-Permute-0.12.tar.gz)
options=(!emptydirs)
md5sums=('93c9e11af9511390379720fe046fb960')

build() {
	cd Algorithm-Permute-0.12
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Algorithm-Permute-0.12
	make test
}

package() {
	cd Algorithm-Permute-0.12
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
