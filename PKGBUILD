# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lwp-consolelogger'
pkgver='1.000003'
pkgrel='1'
pkgdesc="LWP tracing and debugging"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-capture-tiny>=0' 'perl-class-method-modifiers>=0' 'perl-data-printer>=0.36' 'perl-datetime>=0' 'perl-html-formattext-withlinks>=0' 'perl-html-restrict>=0' 'perl-http-body>=0' 'perl-http-cookiejar>=0' 'perl-http-cookiemonster>=0' 'perl-http-cookies>=0' 'perl-http-message>=0' 'perl-http-server-simple-psgi>=0' 'perl-ipc-run3>=0' 'perl-json-maybexs>=1.003005' 'perl-list-allutils>=0' 'perl-log-dispatch>=2.56' 'perl-log-dispatch-array>=0' 'perl-module-runtime>=0' 'perl-moo>=0' 'perl-moox-strictconstructor>=0' 'perl-parse-mime>=0' 'perl-path-tiny>=0' 'perl-plack>=0' 'perl-plack-test-agent>=0' 'perl-ref-util>=0' 'perl-string-trim>=0' 'perl-sub-exporter>=0' 'perl-term-size-any>=0' 'perl-term-table>=0.028' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl-unicode-linebreak>=0' 'perl-www-mechanize>=0' 'perl-libwww>=0' 'perl>=5.016')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-lwp-useragent>=0' 'perl-test-needs>=0' 'perl-test-warnings>=0')
url='https://metacpan.org/release/LWP-ConsoleLogger'
source=("http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/LWP-ConsoleLogger-$pkgver.tar.gz")
md5sums=('aaa13447c809174747cef75bbcbd37fd')
sha512sums=('df56168f61fdaa4a9a973e266582378441bacb2114df32a273ed1eeae3b97d6f1dccc8d9c11caeeef05be76c37b7f0d35b44dc02968ce49f4f80d6e911582e08')
_distdir="LWP-ConsoleLogger-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
