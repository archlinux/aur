# Maintainer:  Paul Clark <paul500clark at gmail dot com>
pkgname=perl-tk-toolbar
pkgver=0.12
pkgrel=1
pkgdesc="A toolbar widget for Perl/Tk"
arch=('any')
url="https://metacpan.org/release/Tk-ToolBar"
license=('PerlArtistic')
depends=('perl' 'perl-tk')
source=("https://cpan.metacpan.org/authors/id/A/AS/ASB/Tk-ToolBar-$pkgver.tar.gz")
sha512sums=('2eb302b9ee534a0670f8fc739d25c582e070a6cd3d7d8678a6e8c88b150313560d6f74ec5d6e047ef8fca38841948a9537eba35945a22aa8828cdd1e56ae15d1')

build() {
  cd Tk-ToolBar-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Tk-ToolBar-$pkgver
  make install DESTDIR="$pkgdir"
}
