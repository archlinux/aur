# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-storage-format-xml-simple'
pkgver='0.04'
pkgrel='1'
pkgdesc="An XML::Simple serialization role"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-storage' 'perl-xml-simple')
makedepends=()
url='http://search.cpan.org/dist/MooseX-Storage-Format-XML-Simple'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRUNORC/MooseX-Storage-Format-XML-Simple-0.04.tar.gz')
md5sums=('322336ef0ad495e19e4c4555319bc515')
sha512sums=('12fee610039c20ad471aac048ed4312bc9f1e2c321f84c0bcba2e49b9b434463ce2f854f17e44f47be20853b192ded7ae76fdddf7302621d2e9847ece2ff9bb9')
_distdir="MooseX-Storage-Format-XML-Simple-0.04"

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
