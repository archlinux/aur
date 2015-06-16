# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-authorization-abilities'
pkgver='0.31.0'
pkgrel='1'
pkgdesc="Ability based authorization for Catalyst/DBIx::Class apps, based on Catalyst::Plugin::Authorization::Roles"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-authentication-store-dbix-class' 'perl-catalyst-devel' 'perl-catalyst-model-dbic-schema' 'perl-catalyst-plugin-authentication' 'perl-catalyst-plugin-session' 'perl-catalyst-plugin-session-state-cookie' 'perl-catalyst-plugin-session-store-fastmmap' 'perl-catalyst-runtime>=5.80' 'perl-catalyst-view-tt' 'perl-catalystx-simplelogin' 'perl-config-jfdi' 'perl-dbd-sqlite' 'perl-dbix-class' 'perl-dbix-class-datetime-epoch' 'perl-dbix-class-encodedcolumn' 'perl-hash-merge' 'perl-html-formfu' 'perl-http-message' 'perl-module-install' 'perl-moose' 'perl-moosex-nonmoose' 'perl-moosex-types-path-class' 'perl-namespace-autoclean' 'perl-path-class' 'perl-sql-translator' 'perl-universal-require')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-Authorization-Abilities'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Catalyst-Plugin-Authorization-Abilities-v0.31.0.tar.gz')
md5sums=('11a832fdd03baa7aa48b66c4052afa0a')
sha512sums=('6a1c7043bbb2520d56d52a406e3bd4392ac4fa64490490a850796e0ad48463927c28a7792aa83b7184c8f96ff2fc50be8671d8ba38e2af6ecaf8794dcbabaf35')
_distdir="Catalyst-Plugin-Authorization-Abilities-v0.31.0"

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
