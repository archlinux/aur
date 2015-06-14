# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=perl-docs
pkgver=5.20.1
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
source=(http://perldoc.perl.org/perldoc-html.tar.gz)
package() {
  cd "$srcdir"/perldoc-html 

  install -d "$pkgdir"/usr/share/doc/perl/ 
  cp -rf * "$pkgdir"/usr/share/doc/perl 
}
sha256sums=('fe06a7f25775f9e707726e4197ef88ca291e805736c9510bcc5305a1e443a701')
