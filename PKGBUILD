# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu

pkgname=perl-docs
pkgver=5.36.1
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
source=("https://github.com/adrien1018/perldoc-html-generator/releases/download/0.1-$pkgver/perldoc-html-$pkgver.tar.xz")
sha256sums=('52ac356c0ec0b4e0643a2447ec6fa5dcdd582a0d2e1cd863e349a6a684d24e48')

package() {
  cd "$srcdir/perldoc-html-$pkgver"
  install -d "$pkgdir"/usr/share/doc/perl/
  cp -rf * "$pkgdir"/usr/share/doc/perl
}
