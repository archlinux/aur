# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-catalyst-model-dbic-schema'
pkgver='0.65'
pkgrel='1'
pkgdesc="DBIx::Class::Schema Model Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan' 'perl-catalyst-component-instancepercontext' 'perl-catalyst-runtime>=5.80005' 'perl-catalystx-component-traits>=0.14' 'perl-dbix-class>=0.08114' 'perl-dbix-class-schema-loader>=0.04005' 'perl-hash-merge' 'perl-list-moreutils' 'perl-module-runtime>=0.012' 'perl-moose>=1.12' 'perl-moosex-markasmethods>=0.13' 'perl-moosex-nonmoose>=0.16' 'perl-moosex-types' 'perl-moosex-types-loadableclass>=0.009' 'perl-tie-ixhash' 'perl-try-tiny' 'perl-namespace-autoclean>=0.09' 'perl-namespace-clean' 'perl>=5.8.1')
makedepends=('perl-dbd-sqlite')
checkdepends=('perl-test-exception' 'perl-test-requires')
url='http://search.mcpan.org/dist/Catalyst-Model-DBIC-Schema'
source=('http://search.mcpan.org/CPAN/authors/id/G/GB/GBJK/Catalyst-Model-DBIC-Schema-0.65.tar.gz')
md5sums=('8db4a9c80610c24bfbc571e26e18ec6a')
sha512sums=('26b9efbcabb1d32e073ab4c67dd5daba568170261a7e99a5a7ade03412860b860a0216a011c170fc3b2db2ca8cee80d8c557eb5fb24a1696b91c4adc598ec171')
_distdir="Catalyst-Model-DBIC-Schema-0.65"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
