# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu

pkgname=perl-docs
pkgver=5.22.0
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
source=(perldoc-html-$pkgver.tar.gz::http://perldoc.perl.org/perldoc-html.tar.gz)
sha256sums=('587786dfe158b9f832a02121d017a36eedd158aa47113947ebe9150c60c6c112')
package() {
  cd "$srcdir"/perldoc-html

  install -d "$pkgdir"/usr/share/doc/perl/
  cp -rf * "$pkgdir"/usr/share/doc/perl
}
