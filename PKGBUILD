# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=lingot
pkgver=0.9.1
pkgrel=2
pkgdesc="A Guitar tuner"
url="http://www.nongnu.org/lingot/"
license=('GPL')
arch=(i686 x86_64)
depends=(gtk2 libglade jack)
makedepends=('perlxml' 'intltool' 'gtk2')
source=(http://download.savannah.gnu.org/releases/lingot/$pkgname-$pkgver.tar.gz)
md5sums=('5a61c88e3770270246385ab9dbc39793')

build() {
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make DESTDIR=$pkgdir install
}
