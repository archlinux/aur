# CPAN Name  : Catalyst-Plugin-Unicode
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-catalyst-plugin-unicode'
pkgver='0.93'
pkgrel='1'
pkgdesc="Unicode aware Catalyst (old style)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.70' 'perl-io-stringy' 'perl-mro-compat>=0.10' 'perl-test-use-ok' 'perl-test-www-mechanize-catalyst')
url='http://search.cpan.org/dist/Catalyst-Plugin-Unicode'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Unicode-0.93.tar.gz')
md5sums=('f362bfa2ec2bb70378717122e2da018d')

build() {
  DIST_DIR="${srcdir}/Catalyst-Plugin-Unicode-0.93"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
