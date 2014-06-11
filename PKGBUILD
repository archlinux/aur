# CPAN Name  : Cache::Simple::TimedExpiry
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-cache-simple-timedexpiry
pkgver=0.27
pkgrel=1
pkgdesc='Perl package providing a lightweight cache with timed expiration'
arch=('any')
url='http://search.cpan.org/dist/Cache-Simple-TimedExpiry'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Cache-Simple-TimedExpiry-0.27.tar.gz)
options=(!emptydirs)
md5sums=('4ef124ab7776f3c257b9ffbed917e67a')

build() {
	cd Cache-Simple-TimedExpiry-0.27
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Cache-Simple-TimedExpiry-0.27
	make test
}

package() {
	cd Cache-Simple-TimedExpiry-0.27
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
