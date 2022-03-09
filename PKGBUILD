# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu

pkgname=perl-docs
pkgver=5.34.0
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
source=("https://github.com/adrien1018/perldoc-html-generator/releases/download/0.1/perldoc-html-$pkgver.tar.xz")
sha256sums=('9b06f7f20ecfc9d58f71f9dca5469db47a35b63798d0171e97cfe391a5e1fa83')

package() {
  cd "$srcdir/perldoc-html-$pkgver"
  install -d "$pkgdir"/usr/share/doc/perl/
  cp -rf * "$pkgdir"/usr/share/doc/perl
}
