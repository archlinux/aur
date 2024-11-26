# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu

pkgname=perl-docs
pkgver=5.40.0
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
source=("https://github.com/adrien1018/perldoc-html-generator/releases/download/0.1-$pkgver/perldoc-html-$pkgver.tar.xz")
sha256sums=('032bd4bcc051cd9c55c9b55d5be1acb62e0884f4460f697bb8eae83842fe396e')

package() {
  cd "$srcdir/perldoc-html-$pkgver"
  install -d "$pkgdir"/usr/share/doc/perl/
  cp -rf * "$pkgdir"/usr/share/doc/perl
}
