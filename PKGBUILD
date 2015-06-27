# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=UNIVERSAL-DOES
pkgname=perl-universal-does
pkgver=0.005
pkgrel=1
pkgdesc="Provides UNIVERSAL::DOES() method for older perls"
arch=("any")
url="http://search.cpan.org/~gfuji/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/$_perlmod-$pkgver.tar.gz)
md5sums=('a621145924f1fbf48d63a8ae59e9203f')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}
