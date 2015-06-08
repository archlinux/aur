# Maintainer: Jonne Haß <me@mrzyx.de>
_author="silasmonk"
_perlmod="CGI-Application-Plugin-Authentication"
pkgname=perl-cgi-application-plugin-authentication
pkgver=0.20
pkgrel=1
pkgdesc="CGI::Application::Plugin::Authentication - Authentication framework for CGI::Application"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-cgi-application')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/S/SI/SILASMONK/$_perlmod-$pkgver.tar.gz)
md5sums=('5b4ff96b2f703b11bae13308aee7bd30')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build install
}

# vim:set ts=2 sw=2 et:
