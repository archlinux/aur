# CPAN Name  : B::Hooks::OP::Annotation
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-b-hooks-op-annotation
pkgver=0.44
pkgrel=1
pkgdesc="Perl module that allows XS modules to annotate and delegate hooked OPs"
arch=("i686" "x86_64")
url="http://search.cpan.org/dist/B-Hooks-OP-Annotation"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-extutils-depends>=0.304")
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/B-Hooks-OP-Annotation-0.44.tar.gz)
options=(!emptydirs)
md5sums=("18b1f0088850effe58ccb4a7c9dc4024")

build() {
  cd "$srcdir/B-Hooks-OP-Annotation-0.44"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/B-Hooks-OP-Annotation-0.44"
  make test
}

package() {
  cd "$srcdir/B-Hooks-OP-Annotation-0.44"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
