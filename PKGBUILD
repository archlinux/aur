# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lite2do
pkgver=1.1.1
pkgrel=1
pkgdesc="A  lightweight command-line todo manager written in Perl"
arch=('any')
url="http://w2do.blackened.cz/"
license=('GPL3')
depends=('perl')
source=(http://w2do.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('370bcf901aef70faca6de7dcccb412a3')

package() {
  cd $pkgname-$pkgver

  make INSTALL=/bin/install \
       POD2MAN=/usr/lib/perl5/core_perl/bin/pod2man \
       prefix="${pkgdir}"/usr \
       install
}
