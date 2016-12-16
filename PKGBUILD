# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=AnyEvent-CacheDNS
cpanauthor=POTYL
pkgname=perl-anyevent-cachedns
pkgver=0.08
pkgrel=1
pkgdesc="Perl AnyEvent::CacheDNS CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-anyevent')
makedepends=('perl-module-build')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('41c1faf183b61806b55889ceea1237750c1f61b9ce2735fdf33dc05536712dae')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build.PL
	 perl Build
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build install destdir="${pkgdir}"
}
