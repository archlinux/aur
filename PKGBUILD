# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-catalyst-authentication-store-dbix-class'
pkgver='0.1506'
pkgrel='1'
pkgdesc="A storage class for Catalyst Authentication using DBIx::Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-model-dbic-schema>=0.18' 'perl-catalyst-plugin-authentication>=0.10008' 'perl-catalyst-runtime>=5.8' 'perl-dbix-class>=0.08' 'perl-list-moreutils' 'perl-moose' 'perl-try-tiny' 'perl-namespace-autoclean' 'perl>=5.8.1')
makedepends=()
url='http://search.mcpan.org/dist/Catalyst-Authentication-Store-DBIx-Class'
source=('http://search.mcpan.org/CPAN/authors/id/I/IL/ILMARI/Catalyst-Authentication-Store-DBIx-Class-0.1506.tar.gz')
md5sums=('b506cabc500730da343e98aad45539a0')
sha512sums=('1d73a881934c8cea29bcbb09de1449d74c2b3b8b9cf2204ad82d602e086651b4702f6203248bdcb9f528b9e43aa0514b98e0c0d86f3d5742f818d1ea8682b4f3')
_distdir="Catalyst-Authentication-Store-DBIx-Class-0.1506"

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
