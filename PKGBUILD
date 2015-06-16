# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-fillinform-forceutf8'
pkgver='0.02'
pkgrel='1'
pkgdesc="FillInForm with utf8 flag for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-html-fillinform-forceutf8')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-FillInForm-ForceUTF8'
source=('http://search.cpan.org/CPAN/authors/id/H/HI/HIDE/Catalyst-Plugin-FillInForm-ForceUTF8-0.02.tar.gz')
md5sums=('e17b8788854c572244a718bc8a5911dc')
sha512sums=('1d9d74541ff1bc21a55dfabfd5a4d89762301573c36c1c2f431127d0aed9cd3ebdb02951f82c0ad4d99dba631f062ba37a43f688da45ec2273c44c4ee53c3dee')
_distdir="Catalyst-Plugin-FillInForm-ForceUTF8-0.02"

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
