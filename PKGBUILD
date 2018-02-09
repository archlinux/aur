# Contributor: Albert Chang <albert.chang@gmx.com>

pkgname=perl-net-twitter-lite
pkgver=0.12008
pkgrel=1
pkgdesc="A perl interface to the Twitter API"
arch=('any')
url="http://search.cpan.org/dist/Net-Twitter-Lite/"
license=('GPL' 'PerlArtistic')
depends=('perl-json' 'perl-libwww')
makedepends=('perl-module-build-tiny')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MM/MMIMS/Net-Twitter-Lite-$pkgver.tar.gz")
md5sums=('3aa6ffd531f154ac17bc6f9f9134e23b')

build() {
  cd Net-Twitter-Lite-$pkgver
  perl Build.PL
  perl Build
}

package() {
  cd Net-Twitter-Lite-$pkgver
  perl Build install --installdirs=vendor --destdir="$pkgdir"
}
